; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude OctoMapScan.msg.html

(cl:defclass <OctoMapScan> (roslisp-msg-protocol:ros-message)
  ((mapPoints
    :reader mapPoints
    :initarg :mapPoints
    :type ptam_com-msg:OctoMapPointArray
    :initform (cl:make-instance 'ptam_com-msg:OctoMapPointArray))
   (keyFramePose
    :reader keyFramePose
    :initarg :keyFramePose
    :type geometry_msgs-msg:PoseWithCovarianceStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseWithCovarianceStamped)))
)

(cl:defclass OctoMapScan (<OctoMapScan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OctoMapScan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OctoMapScan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<OctoMapScan> is deprecated: use ptam_com-msg:OctoMapScan instead.")))

(cl:ensure-generic-function 'mapPoints-val :lambda-list '(m))
(cl:defmethod mapPoints-val ((m <OctoMapScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:mapPoints-val is deprecated.  Use ptam_com-msg:mapPoints instead.")
  (mapPoints m))

(cl:ensure-generic-function 'keyFramePose-val :lambda-list '(m))
(cl:defmethod keyFramePose-val ((m <OctoMapScan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:keyFramePose-val is deprecated.  Use ptam_com-msg:keyFramePose instead.")
  (keyFramePose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OctoMapScan>) ostream)
  "Serializes a message object of type '<OctoMapScan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mapPoints) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'keyFramePose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OctoMapScan>) istream)
  "Deserializes a message object of type '<OctoMapScan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mapPoints) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'keyFramePose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OctoMapScan>)))
  "Returns string type for a message object of type '<OctoMapScan>"
  "ptam_com/OctoMapScan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OctoMapScan)))
  "Returns string type for a message object of type 'OctoMapScan"
  "ptam_com/OctoMapScan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OctoMapScan>)))
  "Returns md5sum for a message object of type '<OctoMapScan>"
  "6300a17df88639b05a1a89ffdf26ee86")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OctoMapScan)))
  "Returns md5sum for a message object of type 'OctoMapScan"
  "6300a17df88639b05a1a89ffdf26ee86")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OctoMapScan>)))
  "Returns full string definition for message of type '<OctoMapScan>"
  (cl:format cl:nil "OctoMapPointArray mapPoints~%geometry_msgs/PoseWithCovarianceStamped keyFramePose~%~%~%================================================================================~%MSG: ptam_com/OctoMapPointArray~%OctoMapPointStamped[] mapPoints~%~%================================================================================~%MSG: ptam_com/OctoMapPointStamped~%Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/PoseWithCovarianceStamped~%# This expresses an estimated pose with a reference coordinate frame and timestamp~%~%Header header~%PoseWithCovariance pose~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OctoMapScan)))
  "Returns full string definition for message of type 'OctoMapScan"
  (cl:format cl:nil "OctoMapPointArray mapPoints~%geometry_msgs/PoseWithCovarianceStamped keyFramePose~%~%~%================================================================================~%MSG: ptam_com/OctoMapPointArray~%OctoMapPointStamped[] mapPoints~%~%================================================================================~%MSG: ptam_com/OctoMapPointStamped~%Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/PoseWithCovarianceStamped~%# This expresses an estimated pose with a reference coordinate frame and timestamp~%~%Header header~%PoseWithCovariance pose~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OctoMapScan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mapPoints))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'keyFramePose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OctoMapScan>))
  "Converts a ROS message object to a list"
  (cl:list 'OctoMapScan
    (cl:cons ':mapPoints (mapPoints msg))
    (cl:cons ':keyFramePose (keyFramePose msg))
))
