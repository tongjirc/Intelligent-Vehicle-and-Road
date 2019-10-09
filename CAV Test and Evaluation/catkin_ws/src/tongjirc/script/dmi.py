#!/usr/bin/env python
# -*- coding: utf-8 -*-
#Created by Alvin. Zixuan  tongjirc
#MAY. 1th 2019

import time,sys,math,re
import threading
import PyQt5
import rospy
import std_msgs
import socket
import gurobipy
import filterpy
import time
import math
import tf
import routePlan
import numpy as np
import mpc
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import pyqtSlot,QTimer
from std_msgs.msg import String,Duration
from output.msg import output
from std_msgs.msg import Float64
from sensor_msgs.msg import Imu
from marvelmind_nav.msg import hedge_pos_ang
from trajectory_msgs.msg import JointTrajectoryPoint
from geometry_msgs.msg import Pose2D,Twist,Quaternion,PoseStamped,Point
from nav_msgs.msg import Odometry,Path




enginevalue = 1500
steeringvalue = 1500
selfmotor = output()  # rcinput class
imudata=Imu()
goal=JointTrajectoryPoint()
statusJP=JointTrajectoryPoint()
started=False
statusPose=Pose2D()
odomstate=Odometry()
mpcinitialstate=mpc.State()

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


def mpcControl(initial_state,cx,cy,cyaw,cv,ca,cj):
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
    ck=0
    sp=mpc.calc_speed_profile(cx, cy, cyaw, cv[0])
    t, x, y, yaw, v, d, a = mpc.go(
        cx, cy, cyaw, ck, sp, dl, initial_state)
    return a[0],d[0]



class Subpub():

    "Subscribe the arduino and publish the instruction in the block"

    def __init__(self):
        # Give the node a name
        rospy.init_node('dmi', anonymous=False)
        global enginevalue, steeringvalue
        # Publisher to the arduino
        self.pub_steer = rospy.Publisher('st_msg',Float64,queue_size=1)
        self.pub_engine = rospy.Publisher('en_msg', Float64, queue_size=1)
        # Wait forthe /arduino topic to become available
        rospy.Subscriber('arduino', output, self.update_statevalue)
        rospy.loginfo("Subscribe arduino message ")

        # Wait for the /imu topic to become available
        rospy.Subscriber('imu', Imu, self.update_imudata)
        rospy.loginfo("Subscribe Imu")

        # Wait for the /roadside topic to become available
        rospy.Subscriber('/goal', String, self.update_goal)
        rospy.loginfo("Subscribe goal")

        # Wait for the /status topic to from odom
        rospy.Subscriber('/status', JointTrajectoryPoint, self.update_status)
        rospy.loginfo("Subscribe mapodom")
        # Setup Timer for publisher
        timer = rospy.Timer(rospy.Duration(0.1), self.timer_callback)  # 1s


    def update_status(self,msg):
        global statusJP
        statusJP=msg

    def update_statevalue(self, msg):

        " update the sate in the block"

        global selfmotor
        selfmotor = msg

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

    def update_imudata(self, msg):

        " update the IMU in the block"

        global imudata
        imudata=msg

    def timer_callback(self,msg):

        "publish the all the publisher when timer tic"

        global enginevalue, steeringvalue,started,statusJP

        """
        Steer Engine
        """
        if (started):
            self.pub_steer.publish(steeringvalue)
            self.pub_engine.publish(enginevalue)
        else:
            self.pub_steer.publish(1500)
            self.pub_engine.publish(1500)

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(690, 513)
        self.pushButton = QtWidgets.QPushButton(Form)
        self.pushButton.setGeometry(QtCore.QRect(190, 470, 89, 25))
        self.pushButton.setObjectName("pushButton")
        self.pushButton_2 = QtWidgets.QPushButton(Form)
        self.pushButton_2.setGeometry(QtCore.QRect(310, 470, 89, 25))
        self.pushButton_2.setObjectName("pushButton_2")
        self.groupBox = QtWidgets.QGroupBox(Form)
        self.groupBox.setGeometry(QtCore.QRect(20, 20, 201, 191))
        self.groupBox.setObjectName("groupBox")
        self.label = QtWidgets.QLabel(self.groupBox)
        self.label.setGeometry(QtCore.QRect(10, 40, 67, 17))
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(self.groupBox)
        self.label_2.setGeometry(QtCore.QRect(10, 100, 67, 17))
        self.label_2.setObjectName("label_2")
        self.textEdit = QtWidgets.QTextEdit(self.groupBox)
        self.textEdit.setGeometry(QtCore.QRect(70, 40, 101, 31))
        self.textEdit.setObjectName("textEdit")
        self.textEdit_2 = QtWidgets.QTextEdit(self.groupBox)
        self.textEdit_2.setGeometry(QtCore.QRect(70, 100, 101, 31))
        self.textEdit_2.setObjectName("textEdit_2")
        self.groupBox_2 = QtWidgets.QGroupBox(Form)
        self.groupBox_2.setGeometry(QtCore.QRect(240, 20, 201, 191))
        self.groupBox_2.setObjectName("groupBox_2")
        self.label_3 = QtWidgets.QLabel(self.groupBox_2)
        self.label_3.setGeometry(QtCore.QRect(10, 40, 67, 17))
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(self.groupBox_2)
        self.label_4.setGeometry(QtCore.QRect(10, 100, 81, 17))
        self.label_4.setObjectName("label_4")
        self.label_5 = QtWidgets.QLabel(self.groupBox_2)
        self.label_5.setGeometry(QtCore.QRect(10, 160, 67, 17))
        self.label_5.setObjectName("label_5")
        self.textEdit_3 = QtWidgets.QTextEdit(self.groupBox_2)
        self.textEdit_3.setGeometry(QtCore.QRect(90, 40, 101, 31))
        self.textEdit_3.setObjectName("textEdit_3")
        self.textEdit_4 = QtWidgets.QTextEdit(self.groupBox_2)
        self.textEdit_4.setGeometry(QtCore.QRect(90, 90, 101, 31))
        self.textEdit_4.setObjectName("textEdit_4")
        self.textEdit_5 = QtWidgets.QTextEdit(self.groupBox_2)
        self.textEdit_5.setGeometry(QtCore.QRect(90, 150, 101, 31))
        self.textEdit_5.setObjectName("textEdit_5")
        self.pushButton_3 = QtWidgets.QPushButton(Form)
        self.pushButton_3.setGeometry(QtCore.QRect(60, 470, 89, 25))
        self.pushButton_3.setObjectName("pushButton_3")
        self.pushButton_4 = QtWidgets.QPushButton(Form)
        self.pushButton_4.setGeometry(QtCore.QRect(440, 470, 89, 25))
        self.pushButton_4.setObjectName("pushButton_4")
        self.groupBox_3 = QtWidgets.QGroupBox(Form)
        self.groupBox_3.setGeometry(QtCore.QRect(470, 20, 201, 191))
        self.groupBox_3.setObjectName("groupBox_3")
        self.label_6 = QtWidgets.QLabel(self.groupBox_3)
        self.label_6.setGeometry(QtCore.QRect(10, 40, 67, 17))
        self.label_6.setObjectName("label_6")
        self.label_7 = QtWidgets.QLabel(self.groupBox_3)
        self.label_7.setGeometry(QtCore.QRect(10, 100, 81, 17))
        self.label_7.setObjectName("label_7")
        self.label_8 = QtWidgets.QLabel(self.groupBox_3)
        self.label_8.setGeometry(QtCore.QRect(10, 160, 67, 17))
        self.label_8.setObjectName("label_8")
        self.textEdit_6 = QtWidgets.QTextEdit(self.groupBox_3)
        self.textEdit_6.setGeometry(QtCore.QRect(90, 40, 101, 31))
        self.textEdit_6.setObjectName("textEdit_6")
        self.textEdit_7 = QtWidgets.QTextEdit(self.groupBox_3)
        self.textEdit_7.setGeometry(QtCore.QRect(90, 90, 101, 31))
        self.textEdit_7.setObjectName("textEdit_7")
        self.textEdit_8 = QtWidgets.QTextEdit(self.groupBox_3)
        self.textEdit_8.setGeometry(QtCore.QRect(90, 150, 101, 31))
        self.textEdit_8.setObjectName("textEdit_8")
        self.groupBox_4 = QtWidgets.QGroupBox(Form)
        self.groupBox_4.setGeometry(QtCore.QRect(20, 210, 321, 191))
        self.groupBox_4.setObjectName("groupBox_4")
        self.label_9 = QtWidgets.QLabel(self.groupBox_4)
        self.label_9.setGeometry(QtCore.QRect(10, 40, 67, 17))
        self.label_9.setObjectName("label_9")
        self.label_10 = QtWidgets.QLabel(self.groupBox_4)
        self.label_10.setGeometry(QtCore.QRect(10, 100, 81, 17))
        self.label_10.setObjectName("label_10")
        self.label_11 = QtWidgets.QLabel(self.groupBox_4)
        self.label_11.setGeometry(QtCore.QRect(10, 150, 67, 17))
        self.label_11.setObjectName("label_11")
        self.textEdit_9 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_9.setGeometry(QtCore.QRect(40, 40, 61, 31))
        self.textEdit_9.setObjectName("textEdit_9")
        self.textEdit_10 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_10.setGeometry(QtCore.QRect(40, 90, 61, 31))
        self.textEdit_10.setObjectName("textEdit_10")
        self.textEdit_11 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_11.setGeometry(QtCore.QRect(40, 140, 61, 31))
        self.textEdit_11.setObjectName("textEdit_11")
        self.label_12 = QtWidgets.QLabel(self.groupBox_4)
        self.label_12.setGeometry(QtCore.QRect(110, 150, 67, 17))
        self.label_12.setObjectName("label_12")
        self.textEdit_12 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_12.setGeometry(QtCore.QRect(140, 40, 61, 31))
        self.textEdit_12.setObjectName("textEdit_12")
        self.label_13 = QtWidgets.QLabel(self.groupBox_4)
        self.label_13.setGeometry(QtCore.QRect(110, 40, 67, 17))
        self.label_13.setObjectName("label_13")
        self.label_14 = QtWidgets.QLabel(self.groupBox_4)
        self.label_14.setGeometry(QtCore.QRect(110, 100, 81, 17))
        self.label_14.setObjectName("label_14")
        self.textEdit_13 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_13.setGeometry(QtCore.QRect(140, 140, 61, 31))
        self.textEdit_13.setObjectName("textEdit_13")
        self.textEdit_14 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_14.setGeometry(QtCore.QRect(140, 90, 61, 31))
        self.textEdit_14.setObjectName("textEdit_14")
        self.textEdit_15 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_15.setGeometry(QtCore.QRect(250, 140, 61, 31))
        self.textEdit_15.setObjectName("textEdit_15")
        self.textEdit_16 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_16.setGeometry(QtCore.QRect(250, 90, 61, 31))
        self.textEdit_16.setObjectName("textEdit_16")
        self.label_15 = QtWidgets.QLabel(self.groupBox_4)
        self.label_15.setGeometry(QtCore.QRect(220, 150, 67, 17))
        self.label_15.setObjectName("label_15")
        self.label_16 = QtWidgets.QLabel(self.groupBox_4)
        self.label_16.setGeometry(QtCore.QRect(220, 100, 81, 17))
        self.label_16.setObjectName("label_16")
        self.label_17 = QtWidgets.QLabel(self.groupBox_4)
        self.label_17.setGeometry(QtCore.QRect(220, 40, 67, 17))
        self.label_17.setObjectName("label_17")
        self.textEdit_17 = QtWidgets.QTextEdit(self.groupBox_4)
        self.textEdit_17.setGeometry(QtCore.QRect(250, 40, 61, 31))
        self.textEdit_17.setObjectName("textEdit_17")
        self.groupBox_5 = QtWidgets.QGroupBox(Form)
        self.groupBox_5.setGeometry(QtCore.QRect(350, 210, 321, 191))
        self.groupBox_5.setObjectName("groupBox_5")
        self.label_18 = QtWidgets.QLabel(self.groupBox_5)
        self.label_18.setGeometry(QtCore.QRect(10, 40, 67, 17))
        self.label_18.setObjectName("label_18")
        self.label_19 = QtWidgets.QLabel(self.groupBox_5)
        self.label_19.setGeometry(QtCore.QRect(10, 100, 81, 17))
        self.label_19.setObjectName("label_19")
        self.label_20 = QtWidgets.QLabel(self.groupBox_5)
        self.label_20.setGeometry(QtCore.QRect(10, 150, 67, 17))
        self.label_20.setObjectName("label_20")
        self.textEdit_18 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_18.setGeometry(QtCore.QRect(40, 40, 61, 31))
        self.textEdit_18.setObjectName("textEdit_18")
        self.textEdit_19 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_19.setGeometry(QtCore.QRect(40, 90, 61, 31))
        self.textEdit_19.setObjectName("textEdit_19")
        self.textEdit_20 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_20.setGeometry(QtCore.QRect(40, 140, 61, 31))
        self.textEdit_20.setObjectName("textEdit_20")
        self.label_21 = QtWidgets.QLabel(self.groupBox_5)
        self.label_21.setGeometry(QtCore.QRect(110, 150, 67, 17))
        self.label_21.setObjectName("label_21")
        self.textEdit_21 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_21.setGeometry(QtCore.QRect(140, 40, 61, 31))
        self.textEdit_21.setObjectName("textEdit_21")
        self.label_22 = QtWidgets.QLabel(self.groupBox_5)
        self.label_22.setGeometry(QtCore.QRect(110, 40, 67, 17))
        self.label_22.setObjectName("label_22")
        self.label_23 = QtWidgets.QLabel(self.groupBox_5)
        self.label_23.setGeometry(QtCore.QRect(110, 100, 81, 17))
        self.label_23.setObjectName("label_23")
        self.textEdit_22 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_22.setGeometry(QtCore.QRect(140, 140, 61, 31))
        self.textEdit_22.setObjectName("textEdit_22")
        self.textEdit_23 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_23.setGeometry(QtCore.QRect(140, 90, 61, 31))
        self.textEdit_23.setObjectName("textEdit_23")
        self.textEdit_24 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_24.setGeometry(QtCore.QRect(250, 140, 61, 31))
        self.textEdit_24.setObjectName("textEdit_24")
        self.textEdit_25 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_25.setGeometry(QtCore.QRect(250, 90, 61, 31))
        self.textEdit_25.setObjectName("textEdit_25")
        self.label_24 = QtWidgets.QLabel(self.groupBox_5)
        self.label_24.setGeometry(QtCore.QRect(220, 150, 67, 17))
        self.label_24.setObjectName("label_24")
        self.label_25 = QtWidgets.QLabel(self.groupBox_5)
        self.label_25.setGeometry(QtCore.QRect(220, 100, 81, 17))
        self.label_25.setObjectName("label_25")
        self.label_26 = QtWidgets.QLabel(self.groupBox_5)
        self.label_26.setGeometry(QtCore.QRect(220, 40, 67, 17))
        self.label_26.setObjectName("label_26")
        self.textEdit_26 = QtWidgets.QTextEdit(self.groupBox_5)
        self.textEdit_26.setGeometry(QtCore.QRect(250, 40, 61, 31))
        self.textEdit_26.setObjectName("textEdit_26")
        self.checkBox = QtWidgets.QCheckBox(Form)
        self.checkBox.setGeometry(QtCore.QRect(20, 420, 92, 23))
        self.checkBox.setObjectName("checkBox")
        self.checkBox_2 = QtWidgets.QCheckBox(Form)
        self.checkBox_2.setGeometry(QtCore.QRect(110, 420, 92, 23))
        self.checkBox_2.setObjectName("checkBox_2")
        self.checkBox_3 = QtWidgets.QCheckBox(Form)
        self.checkBox_3.setGeometry(QtCore.QRect(190, 420, 111, 23))
        self.checkBox_3.setObjectName("checkBox_3")
        self.checkBox_4 = QtWidgets.QCheckBox(Form)
        self.checkBox_4.setGeometry(QtCore.QRect(310, 420, 111, 23))
        self.checkBox_4.setObjectName("checkBox_4")
        self.checkBox_5 = QtWidgets.QCheckBox(Form)
        self.checkBox_5.setGeometry(QtCore.QRect(420, 420, 131, 23))
        self.checkBox_5.setObjectName("checkBox_5")
        self.checkBox_6 = QtWidgets.QCheckBox(Form)
        self.checkBox_6.setGeometry(QtCore.QRect(550, 420, 131, 23))
        self.checkBox_6.setObjectName("checkBox_6")
        self.pushButton_5 = QtWidgets.QPushButton(Form)
        self.pushButton_5.setGeometry(QtCore.QRect(560, 470, 89, 25))
        self.pushButton_5.setObjectName("pushButton_5")

        #attached
        self.retranslateUi(Form)
        self.pushButton.clicked.connect(self.go_go)
        self.pushButton_2.clicked.connect(self.go_stop)
        self.pushButton_3.clicked.connect(self.go_control)
        self.pushButton_4.clicked.connect(self.go_exit)
        self.pushButton_5.clicked.connect(self.go_something)
        QtCore.QMetaObject.connectSlotsByName(Form)
        self.timer1=QTimer()
        self.timer1.start(1000)  #1000ms
        self.timer1.timeout.connect(self.timer1_handler)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Tongjirc"))
        self.pushButton.setText(_translate("Form", "Go"))
        self.pushButton_2.setText(_translate("Form", "Stop"))
        self.groupBox.setTitle(_translate("Form", "Write"))
        self.label.setText(_translate("Form", "Engine"))
        self.label_2.setText(_translate("Form", "Steering"))
        self.groupBox_2.setTitle(_translate("Form", "Read OBU"))
        self.label_3.setText(_translate("Form", "Motor"))
        self.label_4.setText(_translate("Form", "Orentation"))
        self.label_5.setText(_translate("Form", "State"))
        self.pushButton_3.setText(_translate("Form", "Control"))
        self.pushButton_4.setText(_translate("Form", "Exit"))
        self.groupBox_3.setTitle(_translate("Form", "Read RSU"))
        self.label_6.setText(_translate("Form", "Motor"))
        self.label_7.setText(_translate("Form", "Orentation"))
        self.label_8.setText(_translate("Form", "State"))
        self.groupBox_4.setTitle(_translate("Form", "Status"))
        self.label_9.setText(_translate("Form", "Xx"))
        self.label_10.setText(_translate("Form", "Xy"))
        self.label_11.setText(_translate("Form", "Xr"))
        self.label_12.setText(_translate("Form", "Vr"))
        self.label_13.setText(_translate("Form", "Vx"))
        self.label_14.setText(_translate("Form", "Vy"))
        self.label_15.setText(_translate("Form", "Ar"))
        self.label_16.setText(_translate("Form", "Ay"))
        self.label_17.setText(_translate("Form", "Ax"))
        self.groupBox_5.setTitle(_translate("Form", "Goals"))
        self.label_18.setText(_translate("Form", "Xx"))
        self.label_19.setText(_translate("Form", "Xy"))
        self.label_20.setText(_translate("Form", "Xr"))
        self.label_21.setText(_translate("Form", "Vr"))
        self.label_22.setText(_translate("Form", "Vx"))
        self.label_23.setText(_translate("Form", "Vy"))
        self.label_24.setText(_translate("Form", "Ax"))
        self.label_25.setText(_translate("Form", "Ay"))
        self.label_26.setText(_translate("Form", "Yes"))
        self.checkBox.setText(_translate("Form", "Camera"))
        self.checkBox_2.setText(_translate("Form", "Rplidar"))
        self.checkBox_3.setText(_translate("Form", "MaponBoard"))
        self.checkBox_4.setText(_translate("Form", "MaponRoad"))
        self.checkBox_5.setText(_translate("Form", "Readinsidemap"))
        self.checkBox_6.setText(_translate("Form", "Readpath"))
        self.pushButton_5.setText(_translate("Form", "Something"))

    def go_go(self):
        """
        machine control frame
        """
        global enginevalue, steeringvalue,started  # declare the global
        enginevalue = 1
        steeringvalue = 1
        time.sleep(1)   #1s


    def go_control(self):
        """
        Control go to the goal
        """
        started = True

    def go_stop(self):
        """
        Stop the vehicle
        """
        global enginevalue, steeringvalue,started  # declare the global
        if(enginevalue>1600):
            enginevalue=1450
        elif(enginevalue<1400):
            enginevalue=1550
        else:
            pass
        enginevalue = float(self.textEdit.toPlainText())
        steeringvalue = 1500
        started=False

    def go_exit(self):

        "Exit"

        sys.exit(0)

    def go_something(self):
        """
        machine control frame
        """
        started = True

    def timer1_handler(self):

        " update the state to the block"

        global selfmotor,steeringvalue,enginevalue,goal
        self.textEdit_3.setPlainText(str(selfmotor.motor))
        self.textEdit_4.setPlainText(str(selfmotor.steer))
        self.textEdit_5.setPlainText(str(selfmotor.state))
        self.textEdit_6.setPlainText(str(enginevalue))
        self.textEdit_7.setPlainText(str(steeringvalue))
        self.textEdit_8.setPlainText(str(selfmotor.state))
        self.textEdit_9.setPlainText(str(format(statusJP.positions[0],'.3f')))
        self.textEdit_10.setPlainText(str(format(statusJP.positions[1],'.3f')))
        self.textEdit_11.setPlainText(str(format(statusJP.positions[2]*180/math.pi, '.1f')))
        self.textEdit_12.setPlainText(str(format(statusJP.velocities[0],'.3f')))
        self.textEdit_14.setPlainText(str(format(statusJP.velocities[1],'.3f')))
        self.textEdit_13.setPlainText(str(format(statusJP.velocities[2],'.3f')))
        self.textEdit_17.setPlainText(str(format(imudata.linear_acceleration.x,'.3f')))
        self.textEdit_16.setPlainText(str(format(imudata.linear_acceleration.y,'.3f')))
        self.textEdit_15.setPlainText(str(format(imudata.linear_acceleration.z,'.3f')))
        self.textEdit_26.setPlainText(str(format(goal.accelerations[0], '.3f')))
        self.textEdit_25.setPlainText(str(format(goal.accelerations[1], '.3f')))
        self.textEdit_24.setPlainText(str(format(statusJP.accelerations[2], '.1f')))
        self.textEdit_21.setPlainText(str(format(goal.velocities[0], '.3f')))
        self.textEdit_23.setPlainText(str(format(goal.velocities[1], '.3f')))
        self.textEdit_22.setPlainText(str(format(goal.velocities[2], '.3f')))
        self.textEdit_18.setPlainText(str(format(goal.positions[0], '.3f')))
        self.textEdit_19.setPlainText(str(format(goal.positions[1], '.3f')))
        self.textEdit_20.setPlainText(str(format(goal.positions[2]*180/math.pi, '.1f')))
        self.timer1.start(1000)


def form_show():
    # Form attributes
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    try:
        # Threading
        # global roadside
        # t1 = threading.Thread(target=roadside.Server)
        # t2 = threading.Thread(target=roadside.Client)
        # t1.start()
        # t2.start()
        # t1.join()
        # t2.join()
        t2 = threading.Thread(target=form_show)
        t2.start() # Form thread
        Subpub()
        rospy.spin()
    except e:
        pass
    finally:
        # roadside.Terminate()
        sys.exit(0)
