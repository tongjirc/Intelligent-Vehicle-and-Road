; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude OctoMapPointStamped.msg.html

(cl:defclass <OctoMapPointStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (action
    :reader action
    :initarg :action
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass OctoMapPointStamped (<OctoMapPointStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OctoMapPointStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OctoMapPointStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<OctoMapPointStamped> is deprecated: use ptam_com-msg:OctoMapPointStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OctoMapPointStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:header-val is deprecated.  Use ptam_com-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <OctoMapPointStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:action-val is deprecated.  Use ptam_com-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <OctoMapPointStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:position-val is deprecated.  Use ptam_com-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<OctoMapPointStamped>)))
    "Constants for message type '<OctoMapPointStamped>"
  '((:INSERT . 0)
    (:UPDATE . 1)
    (:DELETE . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'OctoMapPointStamped)))
    "Constants for message type 'OctoMapPointStamped"
  '((:INSERT . 0)
    (:UPDATE . 1)
    (:DELETE . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OctoMapPointStamped>) ostream)
  "Serializes a message object of type '<OctoMapPointStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OctoMapPointStamped>) istream)
  "Deserializes a message object of type '<OctoMapPointStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OctoMapPointStamped>)))
  "Returns string type for a message object of type '<OctoMapPointStamped>"
  "ptam_com/OctoMapPointStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OctoMapPointStamped)))
  "Returns string type for a message object of type 'OctoMapPointStamped"
  "ptam_com/OctoMapPointStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OctoMapPointStamped>)))
  "Returns md5sum for a message object of type '<OctoMapPointStamped>"
  "261f3d921672cadc0daf48420ac709b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OctoMapPointStamped)))
  "Returns md5sum for a message object of type 'OctoMapPointStamped"
  "261f3d921672cadc0daf48420ac709b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OctoMapPointStamped>)))
  "Returns full string definition for message of type '<OctoMapPointStamped>"
  (cl:format cl:nil "Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OctoMapPointStamped)))
  "Returns full string definition for message of type 'OctoMapPointStamped"
  (cl:format cl:nil "Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OctoMapPointStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OctoMapPointStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'OctoMapPointStamped
    (cl:cons ':header (header msg))
    (cl:cons ':action (action msg))
    (cl:cons ':position (position msg))
))
