; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude OctoMapPointArray.msg.html

(cl:defclass <OctoMapPointArray> (roslisp-msg-protocol:ros-message)
  ((mapPoints
    :reader mapPoints
    :initarg :mapPoints
    :type (cl:vector ptam_com-msg:OctoMapPointStamped)
   :initform (cl:make-array 0 :element-type 'ptam_com-msg:OctoMapPointStamped :initial-element (cl:make-instance 'ptam_com-msg:OctoMapPointStamped))))
)

(cl:defclass OctoMapPointArray (<OctoMapPointArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OctoMapPointArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OctoMapPointArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<OctoMapPointArray> is deprecated: use ptam_com-msg:OctoMapPointArray instead.")))

(cl:ensure-generic-function 'mapPoints-val :lambda-list '(m))
(cl:defmethod mapPoints-val ((m <OctoMapPointArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:mapPoints-val is deprecated.  Use ptam_com-msg:mapPoints instead.")
  (mapPoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OctoMapPointArray>) ostream)
  "Serializes a message object of type '<OctoMapPointArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mapPoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'mapPoints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OctoMapPointArray>) istream)
  "Deserializes a message object of type '<OctoMapPointArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mapPoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mapPoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ptam_com-msg:OctoMapPointStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OctoMapPointArray>)))
  "Returns string type for a message object of type '<OctoMapPointArray>"
  "ptam_com/OctoMapPointArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OctoMapPointArray)))
  "Returns string type for a message object of type 'OctoMapPointArray"
  "ptam_com/OctoMapPointArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OctoMapPointArray>)))
  "Returns md5sum for a message object of type '<OctoMapPointArray>"
  "f65418a8cd445702b4ff05d157c76c47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OctoMapPointArray)))
  "Returns md5sum for a message object of type 'OctoMapPointArray"
  "f65418a8cd445702b4ff05d157c76c47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OctoMapPointArray>)))
  "Returns full string definition for message of type '<OctoMapPointArray>"
  (cl:format cl:nil "OctoMapPointStamped[] mapPoints~%~%================================================================================~%MSG: ptam_com/OctoMapPointStamped~%Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OctoMapPointArray)))
  "Returns full string definition for message of type 'OctoMapPointArray"
  (cl:format cl:nil "OctoMapPointStamped[] mapPoints~%~%================================================================================~%MSG: ptam_com/OctoMapPointStamped~%Header header~%uint8 INSERT = 0~%uint8 UPDATE = 1~%uint8 DELETE = 2~%~%uint8 action~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OctoMapPointArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mapPoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OctoMapPointArray>))
  "Converts a ROS message object to a list"
  (cl:list 'OctoMapPointArray
    (cl:cons ':mapPoints (mapPoints msg))
))
