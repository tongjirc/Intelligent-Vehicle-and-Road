; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude hedge_imu_raw.msg.html

(cl:defclass <hedge_imu_raw> (roslisp-msg-protocol:ros-message)
  ((timestamp_ms
    :reader timestamp_ms
    :initarg :timestamp_ms
    :type cl:integer
    :initform 0)
   (acc_x
    :reader acc_x
    :initarg :acc_x
    :type cl:fixnum
    :initform 0)
   (acc_y
    :reader acc_y
    :initarg :acc_y
    :type cl:fixnum
    :initform 0)
   (acc_z
    :reader acc_z
    :initarg :acc_z
    :type cl:fixnum
    :initform 0)
   (gyro_x
    :reader gyro_x
    :initarg :gyro_x
    :type cl:fixnum
    :initform 0)
   (gyro_y
    :reader gyro_y
    :initarg :gyro_y
    :type cl:fixnum
    :initform 0)
   (gyro_z
    :reader gyro_z
    :initarg :gyro_z
    :type cl:fixnum
    :initform 0)
   (compass_x
    :reader compass_x
    :initarg :compass_x
    :type cl:fixnum
    :initform 0)
   (compass_y
    :reader compass_y
    :initarg :compass_y
    :type cl:fixnum
    :initform 0)
   (compass_z
    :reader compass_z
    :initarg :compass_z
    :type cl:fixnum
    :initform 0))
)

(cl:defclass hedge_imu_raw (<hedge_imu_raw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hedge_imu_raw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hedge_imu_raw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<hedge_imu_raw> is deprecated: use marvelmind_nav-msg:hedge_imu_raw instead.")))

(cl:ensure-generic-function 'timestamp_ms-val :lambda-list '(m))
(cl:defmethod timestamp_ms-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:timestamp_ms-val is deprecated.  Use marvelmind_nav-msg:timestamp_ms instead.")
  (timestamp_ms m))

(cl:ensure-generic-function 'acc_x-val :lambda-list '(m))
(cl:defmethod acc_x-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:acc_x-val is deprecated.  Use marvelmind_nav-msg:acc_x instead.")
  (acc_x m))

(cl:ensure-generic-function 'acc_y-val :lambda-list '(m))
(cl:defmethod acc_y-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:acc_y-val is deprecated.  Use marvelmind_nav-msg:acc_y instead.")
  (acc_y m))

(cl:ensure-generic-function 'acc_z-val :lambda-list '(m))
(cl:defmethod acc_z-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:acc_z-val is deprecated.  Use marvelmind_nav-msg:acc_z instead.")
  (acc_z m))

(cl:ensure-generic-function 'gyro_x-val :lambda-list '(m))
(cl:defmethod gyro_x-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:gyro_x-val is deprecated.  Use marvelmind_nav-msg:gyro_x instead.")
  (gyro_x m))

(cl:ensure-generic-function 'gyro_y-val :lambda-list '(m))
(cl:defmethod gyro_y-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:gyro_y-val is deprecated.  Use marvelmind_nav-msg:gyro_y instead.")
  (gyro_y m))

(cl:ensure-generic-function 'gyro_z-val :lambda-list '(m))
(cl:defmethod gyro_z-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:gyro_z-val is deprecated.  Use marvelmind_nav-msg:gyro_z instead.")
  (gyro_z m))

(cl:ensure-generic-function 'compass_x-val :lambda-list '(m))
(cl:defmethod compass_x-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:compass_x-val is deprecated.  Use marvelmind_nav-msg:compass_x instead.")
  (compass_x m))

(cl:ensure-generic-function 'compass_y-val :lambda-list '(m))
(cl:defmethod compass_y-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:compass_y-val is deprecated.  Use marvelmind_nav-msg:compass_y instead.")
  (compass_y m))

(cl:ensure-generic-function 'compass_z-val :lambda-list '(m))
(cl:defmethod compass_z-val ((m <hedge_imu_raw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:compass_z-val is deprecated.  Use marvelmind_nav-msg:compass_z instead.")
  (compass_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hedge_imu_raw>) ostream)
  "Serializes a message object of type '<hedge_imu_raw>"
  (cl:let* ((signed (cl:slot-value msg 'timestamp_ms)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gyro_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gyro_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gyro_z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'compass_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'compass_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'compass_z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hedge_imu_raw>) istream)
  "Deserializes a message object of type '<hedge_imu_raw>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_ms) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_z) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gyro_x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gyro_y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gyro_z) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'compass_x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'compass_y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'compass_z) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hedge_imu_raw>)))
  "Returns string type for a message object of type '<hedge_imu_raw>"
  "marvelmind_nav/hedge_imu_raw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hedge_imu_raw)))
  "Returns string type for a message object of type 'hedge_imu_raw"
  "marvelmind_nav/hedge_imu_raw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hedge_imu_raw>)))
  "Returns md5sum for a message object of type '<hedge_imu_raw>"
  "809304d028f09940bd722db544d5d2e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hedge_imu_raw)))
  "Returns md5sum for a message object of type 'hedge_imu_raw"
  "809304d028f09940bd722db544d5d2e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hedge_imu_raw>)))
  "Returns full string definition for message of type '<hedge_imu_raw>"
  (cl:format cl:nil "int64 timestamp_ms~%int16 acc_x~%int16 acc_y~%int16 acc_z~%int16 gyro_x~%int16 gyro_y~%int16 gyro_z~%int16 compass_x~%int16 compass_y~%int16 compass_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hedge_imu_raw)))
  "Returns full string definition for message of type 'hedge_imu_raw"
  (cl:format cl:nil "int64 timestamp_ms~%int16 acc_x~%int16 acc_y~%int16 acc_z~%int16 gyro_x~%int16 gyro_y~%int16 gyro_z~%int16 compass_x~%int16 compass_y~%int16 compass_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hedge_imu_raw>))
  (cl:+ 0
     8
     2
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hedge_imu_raw>))
  "Converts a ROS message object to a list"
  (cl:list 'hedge_imu_raw
    (cl:cons ':timestamp_ms (timestamp_ms msg))
    (cl:cons ':acc_x (acc_x msg))
    (cl:cons ':acc_y (acc_y msg))
    (cl:cons ':acc_z (acc_z msg))
    (cl:cons ':gyro_x (gyro_x msg))
    (cl:cons ':gyro_y (gyro_y msg))
    (cl:cons ':gyro_z (gyro_z msg))
    (cl:cons ':compass_x (compass_x msg))
    (cl:cons ':compass_y (compass_y msg))
    (cl:cons ':compass_z (compass_z msg))
))
