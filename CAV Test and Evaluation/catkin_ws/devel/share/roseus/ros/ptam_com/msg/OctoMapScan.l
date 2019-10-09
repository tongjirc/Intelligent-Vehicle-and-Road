;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::OctoMapScan)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'OctoMapScan (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::OCTOMAPSCAN")
  (make-package "PTAM_COM::OCTOMAPSCAN"))

(in-package "ROS")
;;//! \htmlinclude OctoMapScan.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ptam_com::OctoMapScan
  :super ros::object
  :slots (_mapPoints _keyFramePose ))

(defmethod ptam_com::OctoMapScan
  (:init
   (&key
    ((:mapPoints __mapPoints) (instance ptam_com::OctoMapPointArray :init))
    ((:keyFramePose __keyFramePose) (instance geometry_msgs::PoseWithCovarianceStamped :init))
    )
   (send-super :init)
   (setq _mapPoints __mapPoints)
   (setq _keyFramePose __keyFramePose)
   self)
  (:mapPoints
   (&rest __mapPoints)
   (if (keywordp (car __mapPoints))
       (send* _mapPoints __mapPoints)
     (progn
       (if __mapPoints (setq _mapPoints (car __mapPoints)))
       _mapPoints)))
  (:keyFramePose
   (&rest __keyFramePose)
   (if (keywordp (car __keyFramePose))
       (send* _keyFramePose __keyFramePose)
     (progn
       (if __keyFramePose (setq _keyFramePose (car __keyFramePose)))
       _keyFramePose)))
  (:serialization-length
   ()
   (+
    ;; ptam_com/OctoMapPointArray _mapPoints
    (send _mapPoints :serialization-length)
    ;; geometry_msgs/PoseWithCovarianceStamped _keyFramePose
    (send _keyFramePose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ptam_com/OctoMapPointArray _mapPoints
       (send _mapPoints :serialize s)
     ;; geometry_msgs/PoseWithCovarianceStamped _keyFramePose
       (send _keyFramePose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ptam_com/OctoMapPointArray _mapPoints
     (send _mapPoints :deserialize buf ptr-) (incf ptr- (send _mapPoints :serialization-length))
   ;; geometry_msgs/PoseWithCovarianceStamped _keyFramePose
     (send _keyFramePose :deserialize buf ptr-) (incf ptr- (send _keyFramePose :serialization-length))
   ;;
   self)
  )

(setf (get ptam_com::OctoMapScan :md5sum-) "6300a17df88639b05a1a89ffdf26ee86")
(setf (get ptam_com::OctoMapScan :datatype-) "ptam_com/OctoMapScan")
(setf (get ptam_com::OctoMapScan :definition-)
      "OctoMapPointArray mapPoints
geometry_msgs/PoseWithCovarianceStamped keyFramePose


================================================================================
MSG: ptam_com/OctoMapPointArray
OctoMapPointStamped[] mapPoints

================================================================================
MSG: ptam_com/OctoMapPointStamped
Header header
uint8 INSERT = 0
uint8 UPDATE = 1
uint8 DELETE = 2

uint8 action
geometry_msgs/Vector3 position

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/PoseWithCovarianceStamped
# This expresses an estimated pose with a reference coordinate frame and timestamp

Header header
PoseWithCovariance pose

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :ptam_com/OctoMapScan "6300a17df88639b05a1a89ffdf26ee86")


