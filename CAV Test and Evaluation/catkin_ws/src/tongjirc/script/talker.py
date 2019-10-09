#!/usr/bin/env python2
#created  by Alvin zixuan tongjirc
#Oct. 1th 2018

import rospy
import time
from std_msgs.msg import String,Duration
from trajectory_msgs.msg import JointTrajectoryPoint

jp=JointTrajectoryPoint()

def talker():
    pub = rospy.Publisher('status', JointTrajectoryPoint, queue_size=10)
    rospy.init_node('vehicleclient', anonymous=True)
    rate = rospy.Rate(10)  # 10hz
    while not rospy.is_shutdown():
        jp.positions=[1,2,3,4]
        jp.velocities = [5, 6, 7,8]
        jp.accelerations = [9, 10]
        jp.effort = [1]
        # rospy.Time.now().to_nsec()
        jp.time_from_start=rospy.Duration.from_sec(time.time())
        pub.publish(jp)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
