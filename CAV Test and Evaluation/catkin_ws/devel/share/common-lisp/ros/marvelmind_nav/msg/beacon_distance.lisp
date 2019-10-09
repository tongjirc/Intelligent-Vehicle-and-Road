; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude beacon_distance.msg.html

(cl:defclass <beacon_distance> (roslisp-msg-protocol:ros-message)
  ((address_hedge
    :reader address_hedge
    :initarg :address_hedge
    :type cl:fixnum
    :initform 0)
   (address_beacon
    :reader address_beacon
    :initarg :address_beacon
    :type cl:fixnum
    :initform 0)
   (distance_m
    :reader distance_m
    :initarg :distance_m
    :type cl:float
    :initform 0.0))
)

(cl:defclass beacon_distance (<beacon_distance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <beacon_distance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'beacon_distance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<beacon_distance> is deprecated: use marvelmind_nav-msg:beacon_distance instead.")))

(cl:ensure-generic-function 'address_hedge-val :lambda-list '(m))
(cl:defmethod address_hedge-val ((m <beacon_distance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:address_hedge-val is deprecated.  Use marvelmind_nav-msg:address_hedge instead.")
  (address_hedge m))

(cl:ensure-generic-function 'address_beacon-val :lambda-list '(m))
(cl:defmethod address_beacon-val ((m <beacon_distance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:address_beacon-val is deprecated.  Use marvelmind_nav-msg:address_beacon instead.")
  (address_beacon m))

(cl:ensure-generic-function 'distance_m-val :lambda-list '(m))
(cl:defmethod distance_m-val ((m <beacon_distance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:distance_m-val is deprecated.  Use marvelmind_nav-msg:distance_m instead.")
  (distance_m m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <beacon_distance>) ostream)
  "Serializes a message object of type '<beacon_distance>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address_hedge)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address_beacon)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <beacon_distance>) istream)
  "Deserializes a message object of type '<beacon_distance>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address_hedge)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address_beacon)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_m) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<beacon_distance>)))
  "Returns string type for a message object of type '<beacon_distance>"
  "marvelmind_nav/beacon_distance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'beacon_distance)))
  "Returns string type for a message object of type 'beacon_distance"
  "marvelmind_nav/beacon_distance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<beacon_distance>)))
  "Returns md5sum for a message object of type '<beacon_distance>"
  "0961792211a42c14a3b38a49e24931f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'beacon_distance)))
  "Returns md5sum for a message object of type 'beacon_distance"
  "0961792211a42c14a3b38a49e24931f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<beacon_distance>)))
  "Returns full string definition for message of type '<beacon_distance>"
  (cl:format cl:nil "uint8 address_hedge~%uint8 address_beacon~%float64 distance_m~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'beacon_distance)))
  "Returns full string definition for message of type 'beacon_distance"
  (cl:format cl:nil "uint8 address_hedge~%uint8 address_beacon~%float64 distance_m~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <beacon_distance>))
  (cl:+ 0
     1
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <beacon_distance>))
  "Converts a ROS message object to a list"
  (cl:list 'beacon_distance
    (cl:cons ':address_hedge (address_hedge msg))
    (cl:cons ':address_beacon (address_beacon msg))
    (cl:cons ':distance_m (distance_m msg))
))
