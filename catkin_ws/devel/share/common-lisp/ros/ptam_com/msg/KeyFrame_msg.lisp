; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude KeyFrame_msg.msg.html

(cl:defclass <KeyFrame_msg> (roslisp-msg-protocol:ros-message)
  ((KFids
    :reader KFids
    :initarg :KFids
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (KFs
    :reader KFs
    :initarg :KFs
    :type (cl:vector geometry_msgs-msg:PoseWithCovarianceStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseWithCovarianceStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseWithCovarianceStamped))))
)

(cl:defclass KeyFrame_msg (<KeyFrame_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KeyFrame_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KeyFrame_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<KeyFrame_msg> is deprecated: use ptam_com-msg:KeyFrame_msg instead.")))

(cl:ensure-generic-function 'KFids-val :lambda-list '(m))
(cl:defmethod KFids-val ((m <KeyFrame_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:KFids-val is deprecated.  Use ptam_com-msg:KFids instead.")
  (KFids m))

(cl:ensure-generic-function 'KFs-val :lambda-list '(m))
(cl:defmethod KFs-val ((m <KeyFrame_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:KFs-val is deprecated.  Use ptam_com-msg:KFs instead.")
  (KFs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KeyFrame_msg>) ostream)
  "Serializes a message object of type '<KeyFrame_msg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'KFids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'KFids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'KFs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'KFs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KeyFrame_msg>) istream)
  "Deserializes a message object of type '<KeyFrame_msg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'KFids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'KFids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'KFs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'KFs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseWithCovarianceStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KeyFrame_msg>)))
  "Returns string type for a message object of type '<KeyFrame_msg>"
  "ptam_com/KeyFrame_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KeyFrame_msg)))
  "Returns string type for a message object of type 'KeyFrame_msg"
  "ptam_com/KeyFrame_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KeyFrame_msg>)))
  "Returns md5sum for a message object of type '<KeyFrame_msg>"
  "d865cbd185d5633ac1d50184eb2a3461")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KeyFrame_msg)))
  "Returns md5sum for a message object of type 'KeyFrame_msg"
  "d865cbd185d5633ac1d50184eb2a3461")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KeyFrame_msg>)))
  "Returns full string definition for message of type '<KeyFrame_msg>"
  (cl:format cl:nil "uint32[]   KFids~%geometry_msgs/PoseWithCovarianceStamped[]   KFs~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovarianceStamped~%# This expresses an estimated pose with a reference coordinate frame and timestamp~%~%Header header~%PoseWithCovariance pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KeyFrame_msg)))
  "Returns full string definition for message of type 'KeyFrame_msg"
  (cl:format cl:nil "uint32[]   KFids~%geometry_msgs/PoseWithCovarianceStamped[]   KFs~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovarianceStamped~%# This expresses an estimated pose with a reference coordinate frame and timestamp~%~%Header header~%PoseWithCovariance pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KeyFrame_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'KFids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'KFs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KeyFrame_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'KeyFrame_msg
    (cl:cons ':KFids (KFids msg))
    (cl:cons ':KFs (KFs msg))
))
