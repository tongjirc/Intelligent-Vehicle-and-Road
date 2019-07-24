#!/usr/bin/env python3

#created by Alvin. zixuan  tongjirc
#Oct. 1th 2018
"""
Created on Wed Oct 24 22:28:46 2018

@author: jk963like
"""

import numpy as np
import sys
import rospy
import pandas as pd
import csv
from yolo.msg import yolo
from sensor_msgs.msg import Image
from collections import Counter
from cv_bridge import CvBridge, CvBridgeError
if '/opt/ros/kinetic/lib/python2.7/dist-packages' in sys.path:
    sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')
if '/home/tongjirc/catkin_ws/src/yolo' not in sys.path:
    sys.path.append('/home/tongjirc/catkin_ws/src/yolo')
import cv2


#Publisher setting
rospy.init_node('yolo', anonymous=False)
# Publisher of type std_msgs/Float64
pub = rospy.Publisher('yolo',yolo,queue_size=10)
camera=yolo()
seq=0

# Initialize the parameters
confThreshold = 0.7  # Confidence threshold
nmsThreshold = 0.4  # Non-maximum suppression threshold
inpWidth = 416  # Width of network's input image
inpHeight = 416  # Height of network's input image

# Load names of classes
classesFile = "/home/tongjirc/catkin_ws/src/yolo/coco.names"
classes = None
with open(classesFile, 'rt') as f:
    classes = f.read().rstrip('\n').split('\n')

# Give the configuration and weight files for the model and load the
# network using them.
modelConfiguration = "/home/tongjirc/catkin_ws/src/yolo/yolov3.cfg"
modelWeights = "/home/tongjirc/catkin_ws/src/yolo/yolov3.weights"

net = cv2.dnn.readNetFromDarknet(modelConfiguration, modelWeights)
net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)  # GPU OPENCL CPU CPUdata={'seq':[],'class':[],'left':[],'top':[],'width':[],'height':[]}
#Record in file
data=pd.DataFrame(columns=('seq','class','left','top','width','height'))

def postprocess(frame, outs):
    frameHeight = frame.shape[0]
    frameWidth = frame.shape[1]
    global seq,camera,data
    # Scan through all the bounding boxes output from the network and keep only the
    # ones with high confidence scores. Assign the box's class label as the
    # class with the highest score.
    classIds = []
    confidences = []
    boxes = []
    camera.header.stamp = rospy.Time.now()
    for out in outs:
        for detection in out:
            scores = detection[5:]
            classId = np.argmax(scores)
            confidence = scores[classId]
            if confidence > confThreshold:
                center_x = int(detection[0] * frameWidth)
                center_y = int(detection[1] * frameHeight)
                width = int(detection[2] * frameWidth)
                height = int(detection[3] * frameHeight)
                left = int(center_x - width / 2)
                top = int(center_y - height / 2)
                classIds.append(classId)
                confidences.append(float(confidence))
                boxes.append([left, top, width, height])
                camera.classId = classId
                camera.confidence = confidence
                camera.boxes4 = [left, top, width, height]
                camera.header.frame_id = classes[classId]
                camera.header.seq = seq
                pub.publish(camera)
                data=data.append([{'seq':seq,'class':classId,'left':left,'top':top,'width':width,'height':height}],ignore_index=True)

    seq = seq + 1
    # Perform non maximum suppression to eliminate redundant overlapping boxes with
    # lower confidences.
    indices = cv2.dnn.NMSBoxes(boxes, confidences, confThreshold, nmsThreshold)
    for i in indices:
        i = i[0]
        box = boxes[i]
        left = box[0]
        top = box[1]
        width = box[2]
        height = box[3]
        drawPred(frame, classIds[i], confidences[i], left,
                 top, left + width, top + height)

# Draw the predicted bounding box


def drawPred(frame, classId, conf, left, top, right, bottom):
    # Draw a bounding box.
    cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255))

    label = '%.2f' % conf

    # Get the label for the class name and its confidence
    if classes:
        assert(classId < len(classes))
        label = '%s:%s' % (classes[classId], label)

    # Display the label at the top of the bounding box
    labelSize, baseLine = cv2.getTextSize(
        label, cv2.FONT_HERSHEY_SIMPLEX, 0.5, 1)
    top = max(top, labelSize[1])
    cv2.putText(frame, label, (left, top),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255))


def getOutputsNames(net):
    # Get the names of all the layers in the network
    layersNames = net.getLayerNames()
    # Get the names of the output layers, i.e. the layers with unconnected
    # outputs
    return [layersNames[i[0] - 1] for i in net.getUnconnectedOutLayers()]

#----------------read_video_or_image----------------------


def read_video(path='/home/tongjirc/catkin_ws/src/yolo/run.mp4', outpath='/home/tongjirc/catkin_ws/src/yolo/output.mp4'):
    cap = cv2.VideoCapture(path)  # or .jpg .png
    outputFile = outpath  # or .jpg .png
    vid_writer = cv2.VideoWriter(outputFile, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G'),
                                 30, (round(cap.get(cv2.CAP_PROP_FRAME_WIDTH)), round(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))))
    i = 0
    while cv2.waitKey(1) < 0:

        # get frame from the video
        hasFrame, frame = cap.read()

        # Stop the program if reached end of video
        if not hasFrame:
            print("Done processing !!!")
            print("Output file is stored as ", outputFile)
            cv2.waitKey(3000)
            break

        # Create a 4D blob from a frame.
        blob = cv2.dnn.blobFromImage(
            frame, 1 / 255, (inpWidth, inpHeight), [0, 0, 0], 1, crop=False)

        # Sets the input to the network
        net.setInput(blob)

        # Runs the forward pass to get output of the output layers
        outs = net.forward(getOutputsNames(net))

        # Remove the bounding boxes with low confidence
        postprocess(frame, outs)

        # Put efficiency information. The function getPerfProfile returns the
        # overall time for inference(t) and the timings for each of the
        # layers(in layersTimes)
        t, _ = net.getPerfProfile()
        label = 'Inference time: %.2f ms' % (
            t * 1000.0 / cv2.getTickFrequency())
        cv2.putText(frame, label, (0, 15),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255))

        #------
        cv2.imshow('frame', frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        #-------

        # Write the frame with the detection boxes
        vid_writer.write(frame.astype(np.uint8))
        if path == 0:
            if i > 2000:
                break
            else:
                i += 1

    cap.release()
    vid_writer.release()
    cv2.destroyAllWindows()


def read_img(path='/home/tongjirc/catkin_ws/src/yolo/giraffe.jpg', outpath='/home/tongjirc/catkin_ws/src/yolo/output.jpg'):

    frame = cv2.imread(path)
    # Create a 4D blob from a frame.
    blob = cv2.dnn.blobFromImage(
        frame, 1 / 255, (inpWidth, inpHeight), [0, 0, 0], 1, crop=False)

    # Sets the input to the network
    net.setInput(blob)

    # Runs the forward pass to get output of the output layers
    outs = net.forward(getOutputsNames(net))

    # Remove the bounding boxes with low confidence
    postprocess(frame, outs)

    # Put efficiency information. The function getPerfProfile returns the
    # overall time for inference(t) and the timings for each of the layers(in
    # layersTimes)
    t, _ = net.getPerfProfile()
    label = 'Inference time: %.2f ms' % (t * 1000.0 / cv2.getTickFrequency())
    cv2.putText(frame, label, (0, 15),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255))

    # Write the frame with the detection boxes
    if (1):  # if image 1, if video 0
        cv2.imwrite(outpath, frame.astype(np.uint8))


def read_frame(frame,
             outpath='/home/tongjirc/catkin_ws/src/yolo/output.jpg'):
    # Create a 4D blob from a frame.
    blob = cv2.dnn.blobFromImage(
        frame, 1 / 255, (inpWidth, inpHeight), [0, 0, 0], 1, crop=False)

    # Sets the input to the network
    net.setInput(blob)

    # Runs the forward pass to get output of the output layers
    outs = net.forward(getOutputsNames(net))

    # Remove the bounding boxes with low confidence
    postprocess(frame, outs)

    # Put efficiency information. The function getPerfProfile returns the
    # overall time for inference(t) and the timings for each of the layers(in
    # layersTimes)
    t, _ = net.getPerfProfile()
    label = 'Inference time: %.2f ms' % (t * 1000.0 / cv2.getTickFrequency())
    cv2.putText(frame, label, (0, 15),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255))

    # Write the frame with the detection boxes
    if (1):  # if image 1, if video 0
        cv2.imwrite(outpath, frame.astype(np.uint8))


class Sub():

    def __init__(self):
        self.bridge = CvBridge()
        rospy.wait_for_message('/usb_cam/image_raw', Image)
        self.sub = rospy.Subscriber('/usb_cam/image_raw',Image,self.callback)

    def callback(self, msg):

        try:
            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding="rgb8")
        except CvBridgeError as e:
            print(e)
        (rows, cols, channels) = cv_image.shape
        print(rows)


if __name__ == "__main__":
    try:

        Sub()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        pass
        #global data
        #data.to_csv("yolo.csv", index=False, sep=',')