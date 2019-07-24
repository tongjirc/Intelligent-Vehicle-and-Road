; Auto-generated. Do not edit!


(cl:in-package tongjirc-msg)


;//! \htmlinclude rcinput.msg.html

(cl:defclass <rcinput> (roslisp-msg-protocol:ros-message)
  ((EngineInput
    :reader EngineInput
    :initarg :EngineInput
    :type cl:integer
    :initform 0)
   (SteerInput
    :reader SteerInput
    :initarg :SteerInput
    :type cl:integer
    :initform 0))
)

(cl:defclass rcinput (<rcinput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rcinput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rcinput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tongjirc-msg:<rcinput> is deprecated: use tongjirc-msg:rcinput instead.")))

(cl:ensure-generic-function 'EngineInput-val :lambda-list '(m))
(cl:defmethod EngineInput-val ((m <rcinput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tongjirc-msg:EngineInput-val is deprecated.  Use tongjirc-msg:EngineInput instead.")
  (EngineInput m))

(cl:ensure-generic-function 'SteerInput-val :lambda-list '(m))
(cl:defmethod SteerInput-val ((m <rcinput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tongjirc-msg:SteerInput-val is deprecated.  Use tongjirc-msg:SteerInput instead.")
  (SteerInput m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rcinput>) ostream)
  "Serializes a message object of type '<rcinput>"
  (cl:let* ((signed (cl:slot-value msg 'EngineInput)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'SteerInput)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rcinput>) istream)
  "Deserializes a message object of type '<rcinput>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'EngineInput) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'SteerInput) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rcinput>)))
  "Returns string type for a message object of type '<rcinput>"
  "tongjirc/rcinput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rcinput)))
  "Returns string type for a message object of type 'rcinput"
  "tongjirc/rcinput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rcinput>)))
  "Returns md5sum for a message object of type '<rcinput>"
  "d8fc30fb11cc0f978b5dd3ea0ef06177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rcinput)))
  "Returns md5sum for a message object of type 'rcinput"
  "d8fc30fb11cc0f978b5dd3ea0ef06177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rcinput>)))
  "Returns full string definition for message of type '<rcinput>"
  (cl:format cl:nil "int64 EngineInput~%int64 SteerInput~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rcinput)))
  "Returns full string definition for message of type 'rcinput"
  (cl:format cl:nil "int64 EngineInput~%int64 SteerInput~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rcinput>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rcinput>))
  "Converts a ROS message object to a list"
  (cl:list 'rcinput
    (cl:cons ':EngineInput (EngineInput msg))
    (cl:cons ':SteerInput (SteerInput msg))
))
