; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude Vector3Array.msg.html

(cl:defclass <Vector3Array> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vector3
    :reader vector3
    :initarg :vector3
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3))))
)

(cl:defclass Vector3Array (<Vector3Array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Vector3Array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Vector3Array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<Vector3Array> is deprecated: use ptam_com-msg:Vector3Array instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Vector3Array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:header-val is deprecated.  Use ptam_com-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vector3-val :lambda-list '(m))
(cl:defmethod vector3-val ((m <Vector3Array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:vector3-val is deprecated.  Use ptam_com-msg:vector3 instead.")
  (vector3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Vector3Array>) ostream)
  "Serializes a message object of type '<Vector3Array>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vector3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vector3))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Vector3Array>) istream)
  "Deserializes a message object of type '<Vector3Array>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vector3) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vector3)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Vector3Array>)))
  "Returns string type for a message object of type '<Vector3Array>"
  "ptam_com/Vector3Array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Vector3Array)))
  "Returns string type for a message object of type 'Vector3Array"
  "ptam_com/Vector3Array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Vector3Array>)))
  "Returns md5sum for a message object of type '<Vector3Array>"
  "7bf65100ecb1863f26514d20169e41a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Vector3Array)))
  "Returns md5sum for a message object of type 'Vector3Array"
  "7bf65100ecb1863f26514d20169e41a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Vector3Array>)))
  "Returns full string definition for message of type '<Vector3Array>"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3[] vector3~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Vector3Array)))
  "Returns full string definition for message of type 'Vector3Array"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3[] vector3~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Vector3Array>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vector3) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Vector3Array>))
  "Converts a ROS message object to a list"
  (cl:list 'Vector3Array
    (cl:cons ':header (header msg))
    (cl:cons ':vector3 (vector3 msg))
))
