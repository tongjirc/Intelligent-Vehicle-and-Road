; Auto-generated. Do not edit!


(cl:in-package ptam_com-msg)


;//! \htmlinclude ptam_info.msg.html

(cl:defclass <ptam_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fps
    :reader fps
    :initarg :fps
    :type cl:float
    :initform 0.0)
   (keyframes
    :reader keyframes
    :initarg :keyframes
    :type cl:integer
    :initform 0)
   (trackingQuality
    :reader trackingQuality
    :initarg :trackingQuality
    :type cl:integer
    :initform 0)
   (mapQuality
    :reader mapQuality
    :initarg :mapQuality
    :type cl:boolean
    :initform cl:nil)
   (mapViewerMessage
    :reader mapViewerMessage
    :initarg :mapViewerMessage
    :type cl:string
    :initform "")
   (trackerMessage
    :reader trackerMessage
    :initarg :trackerMessage
    :type cl:string
    :initform ""))
)

(cl:defclass ptam_info (<ptam_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ptam_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ptam_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-msg:<ptam_info> is deprecated: use ptam_com-msg:ptam_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:header-val is deprecated.  Use ptam_com-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'fps-val :lambda-list '(m))
(cl:defmethod fps-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:fps-val is deprecated.  Use ptam_com-msg:fps instead.")
  (fps m))

(cl:ensure-generic-function 'keyframes-val :lambda-list '(m))
(cl:defmethod keyframes-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:keyframes-val is deprecated.  Use ptam_com-msg:keyframes instead.")
  (keyframes m))

(cl:ensure-generic-function 'trackingQuality-val :lambda-list '(m))
(cl:defmethod trackingQuality-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:trackingQuality-val is deprecated.  Use ptam_com-msg:trackingQuality instead.")
  (trackingQuality m))

(cl:ensure-generic-function 'mapQuality-val :lambda-list '(m))
(cl:defmethod mapQuality-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:mapQuality-val is deprecated.  Use ptam_com-msg:mapQuality instead.")
  (mapQuality m))

(cl:ensure-generic-function 'mapViewerMessage-val :lambda-list '(m))
(cl:defmethod mapViewerMessage-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:mapViewerMessage-val is deprecated.  Use ptam_com-msg:mapViewerMessage instead.")
  (mapViewerMessage m))

(cl:ensure-generic-function 'trackerMessage-val :lambda-list '(m))
(cl:defmethod trackerMessage-val ((m <ptam_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-msg:trackerMessage-val is deprecated.  Use ptam_com-msg:trackerMessage instead.")
  (trackerMessage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ptam_info>) ostream)
  "Serializes a message object of type '<ptam_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'keyframes)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'trackingQuality)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mapQuality) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mapViewerMessage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mapViewerMessage))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trackerMessage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trackerMessage))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ptam_info>) istream)
  "Deserializes a message object of type '<ptam_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fps) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'keyframes) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trackingQuality) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'mapQuality) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mapViewerMessage) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mapViewerMessage) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trackerMessage) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trackerMessage) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ptam_info>)))
  "Returns string type for a message object of type '<ptam_info>"
  "ptam_com/ptam_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ptam_info)))
  "Returns string type for a message object of type 'ptam_info"
  "ptam_com/ptam_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ptam_info>)))
  "Returns md5sum for a message object of type '<ptam_info>"
  "798e178ae56263a37e464710cafb5ffc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ptam_info)))
  "Returns md5sum for a message object of type 'ptam_info"
  "798e178ae56263a37e464710cafb5ffc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ptam_info>)))
  "Returns full string definition for message of type '<ptam_info>"
  (cl:format cl:nil "Header      header~%float32     fps~%int32       keyframes~%int32       trackingQuality~%bool        mapQuality~%string      mapViewerMessage~%string      trackerMessage~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ptam_info)))
  "Returns full string definition for message of type 'ptam_info"
  (cl:format cl:nil "Header      header~%float32     fps~%int32       keyframes~%int32       trackingQuality~%bool        mapQuality~%string      mapViewerMessage~%string      trackerMessage~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ptam_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     1
     4 (cl:length (cl:slot-value msg 'mapViewerMessage))
     4 (cl:length (cl:slot-value msg 'trackerMessage))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ptam_info>))
  "Converts a ROS message object to a list"
  (cl:list 'ptam_info
    (cl:cons ':header (header msg))
    (cl:cons ':fps (fps msg))
    (cl:cons ':keyframes (keyframes msg))
    (cl:cons ':trackingQuality (trackingQuality msg))
    (cl:cons ':mapQuality (mapQuality msg))
    (cl:cons ':mapViewerMessage (mapViewerMessage msg))
    (cl:cons ':trackerMessage (trackerMessage msg))
))
