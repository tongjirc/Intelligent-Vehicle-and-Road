#!/usr/bin/env python

import roslib
import rospy
import tf
import math
import time
import sys
import routePlan
import covariance
import mpc
from math import sin, cos, pi
from marvelmind_nav.msg import hedge_pos_ang
from geometry_msgs.msg import Quaternion,Twist
from nav_msgs.msg import Odometry,Path
from trajectory_msgs.msg import JointTrajectoryPoint
from std_msgs.msg import String,Float64
from geometry_msgs.msg import Pose2D,Twist,Quaternion,PoseStamped,Point
from sensor_msgs.msg import Imu
from routePlan import *


goal=JointTrajectoryPoint()
goalpose=PoseStamped()
pose=hedge_pos_ang()
imudata=Imu()
path = Path()
pose2D=Pose2D()
imutime=0 #for record
initialTheta=0 #laser_scan initial theta radient
initialThetalist=[]
statusJP=JointTrajectoryPoint()
statusJP_time=0
pose_time=0
ready=0
enginevalue = 1500
steeringvalue = 1500

started=True
MAX_engine=1620

#initialize goal
goal.positions=[1,1,0]
goal.velocities = [0, 0, 0]
goal.accelerations=[0,0,0]
goal.effort=[1]

#initialize statusJP
statusJP.positions=[0,0,0]
statusJP.velocities = [0, 0, 0]
statusJP.accelerations=[0,0,0]
statusJP.effort=[1]


def mpcControl(initial_state, cx, cy, cyaw, cv, ca, cj):
    """
    :param x1:
    :param y1:
    :param yaw1:
    :param v1:
    :param a1:
    :param j1:
    :return:
    """
    dl = 1.0  # course tick
    ck = 0
    sp = mpc.calc_speed_profile(cx, cy, cyaw, cv[0])
    t, x, y, yaw, v, d, a = mpc.go(
        cx, cy, cyaw, ck, sp, dl, initial_state)
    return a[0], d[0]

def modang(angle):
    """
    modify the angle(radient)
    :param angle:
    :return:
    """
    modify=(0* math.pi) / 180 #modify the yaw
    angle =angle + modify
    # angle = 0
    if (angle > math.pi):
        angle = angle - 2 * math.pi
    elif(angle < -math.pi):
        angle = angle + 2 * math.pi
    angle = angle * 180 / math.pi
    return angle

class OdomNode(object):
    '''
    Helper class for communicating with an Arduino board over serial port
    '''
    def timer_callback(self,msg):
        """
        control vehicle,pathplanning
        :param msg:
        :return:
        """

        self.statuspub()
        self._BroadcastTruthInfo() #broadcast map->odom
        self.goal_show()#show the goal arrow in the rviz
        self.pathPlanandpub()  # Pathplan and vehicle control

    def _BroadcastTruthInfo(self):
        """
        broadcast map->odom
        :return:
        """

        global pose,pose2D,initialTheta,pose_time
        if(pose_time>0):
            x = pose.x_m-(pose2D.x*math.cos(initialTheta)-pose2D.y*math.sin(initialTheta))
            y = pose.y_m-(pose2D.x*math.sin((initialTheta)+pose2D.y*math.cos((initialTheta))))
            z = 0
        else:
            x=0
            y=0
            z=0
        theta=initialTheta
        fo = tf.transformations.quaternion_about_axis(theta, (0,0,1))
        quaternion = Quaternion()
        quaternion.x = fo[0]
        quaternion.y = fo[1]
        quaternion.z = fo[2]
        quaternion.w = fo[3]
        rosNow = rospy.Time.now()
        self._OdometryTransformBroadcaster.sendTransform(
            (x, y, 0),
            (quaternion.x, quaternion.y, quaternion.z, quaternion.w),
            rosNow,
            "odom",
            "map"
        )

        # child: 1 father:2

    def statuspub(self):
        """
        publish true status now publish  \mapodom \status \odom1
        :return:
        """
        global imudata,statusJP_time,ready,statusJP
        try:
            ###
            #pubish the mapodom status
            ###
            (trans, rot) = self._odomlistener.lookupTceransform('/map', '/base_link', rospy.Time(0))
            rosNow = rospy.Time.now()
            odometry = Odometry()
            odometry.header.frame_id = "map"
            odometry.header.stamp = rosNow
            odometry.pose.pose.position.x = trans[0]
            odometry.pose.pose.position.y = trans[1]
            odometry.pose.pose.position.z = trans[2]

            quaternion = Quaternion()
            quaternion.x = rot[0]
            quaternion.y = rot[1]
            quaternion.z = rot[2]
            quaternion.w = rot[3]
            odometry.pose.pose.orientation = quaternion
            statusJP_before=JointTrajectoryPoint()
            statusJP_before.positions = statusJP.positions

            statusJP.positions = trans
            statusJP.positions[2] = tf.transformations.euler_from_quaternion(
                rot)[2]

            vx = statusJP.positions[0] - statusJP_before.positions[0]
            vy = statusJP.positions[1] - statusJP_before.positions[1]
            omega = statusJP.positions[2] - statusJP_before.positions[2]
            # vx = 1
            # vy = 2
            # omega = 3
            if (statusJP_time == 0):
                vx = 0
                vy = 0
                omega = 0
                statusJP_time = 1

            statusJP.velocities = [round(vx, 4), -round(vy, 4), round(omega, 4)]

            odometry.child_frame_id = "base_link"
            odometry.twist.twist.linear.x = vx
            odometry.twist.twist.linear.y = vy
            odometry.twist.twist.angular.z = omega

            statusJP.accelerations = [round(imudata.linear_acceleration.x, 4), round(imudata.linear_acceleration.y, 4),ready]

            self.statusPublisher.publish(statusJP)  # /status
            self._TruthPublisher.publish(odometry)  # /mapodom

            ###
            #               Pubish the odom1
            ###
            (trans, rot) = self._odomlistener.lookupTransform('/odom', '/base_link', rospy.Time(0))
            rosNow = rospy.Time.now()
            odometry1 = Odometry()
            odometry1.header.frame_id = "odom"
            odometry1.header.stamp = rosNow
            odometry1.pose.pose.position.x = trans[0]
            odometry1.pose.pose.position.y = trans[1]
            odometry1.pose.pose.position.z = trans[2]
            odometry1.pose.covariance = covariance.ODOM_POSE_COVARIANCE
            quaternion1 = Quaternion()
            quaternion1.x = rot[0]
            quaternion1.y = rot[1]
            quaternion1.z = rot[2]
            quaternion1.w = rot[3]
            odometry1.pose.pose.orientation = quaternion1
            odometry1.child_frame_id = "base_link"
            odometry1.twist.twist.linear.x = vx
            odometry1.twist.twist.linear.y = vy
            odometry1.twist.twist.angular.z = omega
            odometry1.twist.covariance=covariance.ODOM_TWIST_COVARIANCE
            self._odomPublisher.publish(odometry1)  # /odom1

        except(tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            pass

    def update_pose2D(self, msg):
        """
        update pose2D from laser_scan_matcher
        :param msg:
        :return:
        """
        global pose2D
        pose2D=msg #renew the odom->base_link

    def update_imudata(self, msg):

        " update the IMU in the block"
        global  imutime,imudata
        if(pose2D.theta>-0.5 and pose2D.theta<0.5 and imutime<301):
            self.gettheta(msg)
        else:
            pass
        imudata=msg

    def update_posedata(self,msg):

        "update the pose from marvelmind in the block"

        global pose,pose_time
        pose=msg #renew the map->odom
        pose_time+=1

    def update_goal(self, msg):

        " update the goal in the block"

        global goal
        foo=msg.data.split("/")
        goal.positions[0] = float(foo[0])
        goal.positions[1] = float(foo[1])
        goal.positions[2] = float(foo[2])
        goal.velocities[0] = float(foo[3])
        goal.velocities[1] = float(foo[4])
        goal.velocities[2] = float(foo[5])
        goal.accelerations[0] = float(foo[6])
        goal.accelerations[1] = float(foo[7])
        goal.accelerations[2] = float(foo[8])
        goal.effort[0] = float(foo[9])

    def gettheta(self,msg):
        """
        get the initial theta
        :return:
        """
        global imutime,initialThetalist,initialTheta,ready
        if(imutime<300 and imutime>100):
            theta = tf.transformations.euler_from_quaternion(
                [msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w])[2]
            theta=modang(theta)
            initialThetalist.append(theta)

        elif(imutime==300):
            ready=1
            initialTheta=sum(initialThetalist)/len(initialThetalist)
            initialTheta=0 ##bug
        else:
            pass
        imutime += 1

    def goal_show(self):
        """
        show the goal arrow in the rviz
        :return:
        """
        global goalpose,goal
        goalpose.header.stamp = rospy.Time.now()
        goalpose.header.frame_id = "map"
        foo = tf.transformations.quaternion_about_axis(goal.positions[2], (0, 0, 1))
        goalpose.pose.orientation.x = foo[0]
        goalpose.pose.orientation.y = foo[1]
        goalpose.pose.orientation.z = foo[2]
        goalpose.pose.orientation.w = foo[3]
        position1 = Point()
        position1.x = goal.positions[0]
        position1.y = goal.positions[1]
        position1.z = 0
        goalpose.pose.position = position1
        self.tf_goal.publish(goalpose)

    def pathPlanandpub(self):
        """
        path planning and publish pathv
        :return:
        """
        global enginevalue, goal,steeringvalue, started, statusJP, path  # started no due
        """
        Path Planning
        """
        path = Path()
        rosNow = rospy.Time.now()
        path.header.stamp = rosNow
        path.header.frame_id = "map"
        v = math.pow(statusJP.velocities[0] ** 2 + statusJP.velocities[1] ** 2, 1 / 2)
        a = math.pow(imudata.linear_acceleration.x ** 2 + imudata.linear_acceleration.y ** 2, 1 / 2)
        v_goal = math.pow(goal.velocities[0] ** 2 + goal.velocities[1] ** 2, 1 / 2)
        a_goal = math.pow(goal.accelerations[0] ** 2 + goal.accelerations[1] ** 2, 1 / 2)

        time1, x1, y1, yaw1, v1, a1, j1 = routePlan.quinic_polynomials_planner(
            statusJP.positions[0], statusJP.positions[1], statusJP.positions[2], v, a, goal.positions[0],
            goal.positions[1], goal.positions[2], v_goal, a_goal)

        for i in range(len(x1)):
            stamp = PoseStamped()
            stamp.header.stamp = rosNow
            stamp.header.frame_id = "map"
            foo = tf.transformations.quaternion_about_axis(yaw1[i], (0, 0, 1))
            stamp.pose.orientation.x = foo[0]
            stamp.pose.orientation.y = foo[1]
            stamp.pose.orientation.z = foo[2]
            stamp.pose.orientation.w = foo[3]
            position1 = Point()
            position1.x = x1[i]
            position1.y = y1[i]
            position1.z = 0
            stamp.pose.position = position1
            path.poses.append(stamp)
        self.tf_path.publish(path)
        """
        Vehicle Control
        """
        # foostart=time.time()
        j1 = 0.5
        v = math.pow(statusJP.velocities[0] ** 2 + statusJP.velocities[1] ** 2, 1 / 2)
        mpcstate = mpc.State(x=statusJP.positions[0], y=statusJP.positions[1], yaw=statusJP.positions[2], v=v)
        ca, cs = mpcControl(mpcstate, x1,y1,yaw1,v1,a1,j1)
        # print(ca, cs)
        # print(time.time()-foostart)
        """
        Steer Engine
        """
        if (started):
            """
            Acceleration(ca) and Yaw(cs)to Engine and Steering
            """

            self.pub_steer.publish(steeringvalue)
            self.pub_engine.publish(enginevalue)
        else:
            self.pub_steer.publish(1500)
            self.pub_engine.publish(1500)

    def __init__(self):
        '''
        Initializes the receiver class.
        '''
        rospy.init_node('odomNode')
        rospy.loginfo("Starting odomNode")
        # Wait for the /hedge_pos_ang topic to become available
        rospy.Subscriber('/hedge_pos_ang', hedge_pos_ang, self.update_posedata)
        rospy.loginfo("Subscribe hedge_pos_ang")
        # Wait for the /imu topic to become available
        rospy.Subscriber('imu', Imu, self.update_imudata)
        rospy.loginfo("Subscribe Imu")
        # Wait for the /pose2D topic to become available
        rospy.Subscriber('pose2D', Pose2D, self.update_pose2D)
        rospy.loginfo("Subscribe pose2D")
        # Wait for the /goal topic to from roadside
        rospy.Subscriber('goal', String, self.update_goal)
        rospy.loginfo("Subscribe goal")
        # Publisher
        self._OdometryTransformBroadcaster = tf.TransformBroadcaster()
        self._TruthPublisher = rospy.Publisher("mapodom", Odometry,queue_size=2)
        self._odomPublisher = rospy.Publisher("odom1", Odometry, queue_size=2)
        #broadcast to the roadside
        self.statusPublisher=rospy.Publisher("status",JointTrajectoryPoint,queue_size=2)
        self.tf_path = rospy.Publisher("trajectory", Path, queue_size=1)
        self.tf_goal = rospy.Publisher("tf_goal", PoseStamped, queue_size=1)
        #TF Listener
        self._odomlistener=tf.TransformListener()
        # Publisher to the arduino
        self.pub_steer = rospy.Publisher('st_msg', Float64, queue_size=1)
        self.pub_engine = rospy.Publisher('en_msg', Float64, queue_size=1)
        timer = rospy.Timer(rospy.Duration(0.03), self.timer_callback)




if __name__ == '__main__':
    odomNode = OdomNode()
    try:
        rospy.spin()

    except rospy.ROSInterruptException:
        odomNode.Stop()