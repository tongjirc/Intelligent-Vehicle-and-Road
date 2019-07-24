;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::KeyFrame_srv)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'KeyFrame_srv (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::KEYFRAME_SRV")
  (make-package "PTAM_COM::KEYFRAME_SRV"))
(unless (find-package "PTAM_COM::KEYFRAME_SRVREQUEST")
  (make-package "PTAM_COM::KEYFRAME_SRVREQUEST"))
(unless (find-package "PTAM_COM::KEYFRAME_SRVRESPONSE")
  (make-package "PTAM_COM::KEYFRAME_SRVRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ptam_com::KeyFrame_srvRequest
  :super ros::object
  :slots (_flags ))

(defmethod ptam_com::KeyFrame_srvRequest
  (:init
   (&key
    ((:flags __flags) 0)
    )
   (send-super :init)
   (setq _flags (round __flags))
   self)
  (:flags
   (&optional __flags)
   (if __flags (setq _flags __flags)) _flags)
  (:serialization-length
   ()
   (+
    ;; int32 _flags
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _flags
       (write-long _flags s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _flags
     (setq _flags (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ptam_com::KeyFrame_srvResponse
  :super ros::object
  :slots (_KFids _KFs ))

(defmethod ptam_com::KeyFrame_srvResponse
  (:init
   (&key
    ((:KFids __KFids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:KFs __KFs) (let (r) (dotimes (i 0) (push (instance geometry_msgs::PoseWithCovarianceStamped :init) r)) r))
    )
   (send-super :init)
   (setq _KFids __KFids)
   (setq _KFs __KFs)
   self)
  (:KFids
   (&optional __KFids)
   (if __KFids (setq _KFids __KFids)) _KFids)
  (:KFs
   (&rest __KFs)
   (if (keywordp (car __KFs))
       (send* _KFs __KFs)
     (progn
       (if __KFs (setq _KFs (car __KFs)))
       _KFs)))
  (:serialization-length
   ()
   (+
    ;; uint32[] _KFids
    (* 4    (length _KFids)) 4
    ;; geometry_msgs/PoseWithCovarianceStamped[] _KFs
    (apply #'+ (send-all _KFs :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _KFids
     (write-long (length _KFids) s)
     (dotimes (i (length _KFids))
       (write-long (elt _KFids i) s)
       )
     ;; geometry_msgs/PoseWithCovarianceStamped[] _KFs
     (write-long (length _KFs) s)
     (dolist (elem _KFs)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _KFids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _KFids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _KFids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; geometry_msgs/PoseWithCovarianceStamped[] _KFs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _KFs (let (r) (dotimes (i n) (push (instance geometry_msgs::PoseWithCovarianceStamped :init) r)) r))
     (dolist (elem- _KFs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ptam_com::KeyFrame_srv
  :super ros::object
  :slots ())

(setf (get ptam_com::KeyFrame_srv :md5sum-) "1950b962db053cd38d36594521dda474")
(setf (get ptam_com::KeyFrame_srv :datatype-) "ptam_com/KeyFrame_srv")
(setf (get ptam_com::KeyFrame_srv :request) ptam_com::KeyFrame_srvRequest)
(setf (get ptam_com::KeyFrame_srv :response) ptam_com::KeyFrame_srvResponse)

(defmethod ptam_com::KeyFrame_srvRequest
  (:response () (instance ptam_com::KeyFrame_srvResponse :init)))

(setf (get ptam_com::KeyFrame_srvRequest :md5sum-) "1950b962db053cd38d36594521dda474")
(setf (get ptam_com::KeyFrame_srvRequest :datatype-) "ptam_com/KeyFrame_srvRequest")
(setf (get ptam_com::KeyFrame_srvRequest :definition-)
      "int32 flags
---
uint32[]   KFids
geometry_msgs/PoseWithCovarianceStamped[]   KFs


================================================================================
MSG: geometry_msgs/PoseWithCovarianceStamped
# This expresses an estimated pose with a reference coordinate frame and timestamp

Header header
PoseWithCovariance pose

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

(setf (get ptam_com::KeyFrame_srvResponse :md5sum-) "1950b962db053cd38d36594521dda474")
(setf (get ptam_com::KeyFrame_srvResponse :datatype-) "ptam_com/KeyFrame_srvResponse")
(setf (get ptam_com::KeyFrame_srvResponse :definition-)
      "int32 flags
---
uint32[]   KFids
geometry_msgs/PoseWithCovarianceStamped[]   KFs


================================================================================
MSG: geometry_msgs/PoseWithCovarianceStamped
# This expresses an estimated pose with a reference coordinate frame and timestamp

Header header
PoseWithCovariance pose

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



(provide :ptam_com/KeyFrame_srv "1950b962db053cd38d36594521dda474")


