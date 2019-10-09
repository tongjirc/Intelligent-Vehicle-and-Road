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

statusJP=JointTrajectoryPoint()

class RoadTCP():

    "Roadside communication"

    def __init__(self):
        self._running = True
        #ROS goal publisher
        rospy.init_node('tcp', anonymous=False)
        # Publisher the goal
        self.pub_goal = rospy.Publisher('goal', String, queue_size=1)
        # Subscribe the status
        # Wait for the /imu topic to become available
        rospy.Subscriber('status', JointTrajectoryPoint, self.update_status)
        rospy.loginfo("Subscribe status")

        # Sever
        self.server_road = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_road.bind(('192.168.0.123', 8888))
        self.server_road.listen(5)# 5 max connector

        # Client
        self.server_car = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.HostIp = "192.168.0.106"
        self.PortNow=8888

    def update_status(self, msg):

        " update the statusJP "

        global statusJP
        statusJP=msg

    def Server(self):
        "Setup the onboard server"
        try:
            connect_road, (host_road, port_road) = self.server_road.accept()

            while(self._running):
                #Server
                data = connect_road.recv(1024)
                print(data)
        finally:
            self.server_road.close()

    def Client(self):
        "Connect to the roadside server"
        try:
            self.server_car.connect((self.HostIp, self.PortNow))
            Message = "this is RCCar"

            while(self._running):
                time.sleep(0.05) #0.05s

                self.server_car.send(Message)
        finally:
            self.server_car.close()

    def Terminate(self):
        self._running=False




if __name__ == "__main__":
    try:
        # Threading
        roadside = RoadTCP()
        t1 = threading.Thread(target=roadside.Server)
        t2 = threading.Thread(target=roadside.Client)
        t1.start()
        t2.start()
        rospy.spin()
    except e:
        pass
    finally:
        # roadside.Terminate()
        sys.exit(0)