#!/usr/bin/env python
#created by Alvin. zixuan  tongjirc
#Oct. 1th 2018

import rospy
import csv
import time
import logging
from std_msgs.msg import String
from trajectory_msgs.msg import JointTrajectoryPoint

def callback(data):
    timeremote=data.time_from_start.secs+data.time_from_start.nsecs*1e-9
    timediff=time.time()-timeremote+50
    while(timediff>0.5):
        timediff=timediff-0.5
    while(timediff<-0.5):
        timediff=timediff+0.5
    print(timediff)
    fo = open("foo.txt", "a")
    fo.write(","+ str(timediff))
    fo.close()

def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('Tongjirc_Listener', anonymous=True)

    rospy.Subscriber('chatter', JointTrajectoryPoint, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
   listener()
