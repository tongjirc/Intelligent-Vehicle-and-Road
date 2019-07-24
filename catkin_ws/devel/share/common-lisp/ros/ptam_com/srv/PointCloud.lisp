; Auto-generated. Do not edit!


(cl:in-package ptam_com-srv)


;//! \htmlinclude PointCloud-request.msg.html

(cl:defclass <PointCloud-request> (roslisp-msg-protocol:ros-message)
  ((flags
    :reader flags
    :initarg :flags
    :type cl:integer
    :initform 0))
)

(cl:defclass PointCloud-request (<PointCloud-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloud-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloud-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-srv:<PointCloud-request> is deprecated: use ptam_com-srv:PointCloud-request instead.")))

(cl:ensure-generic-function 'flags-val :lambda-list '(m))
(cl:defmethod flags-val ((m <PointCloud-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-srv:flags-val is deprecated.  Use ptam_com-srv:flags instead.")
  (flags m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloud-request>) ostream)
  "Serializes a message object of type '<PointCloud-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'flags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'flags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'flags)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloud-request>) istream)
  "Deserializes a message object of type '<PointCloud-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'flags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'flags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'flags)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloud-request>)))
  "Returns string type for a service object of type '<PointCloud-request>"
  "ptam_com/PointCloudRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud-request)))
  "Returns string type for a service object of type 'PointCloud-request"
  "ptam_com/PointCloudRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloud-request>)))
  "Returns md5sum for a message object of type '<PointCloud-request>"
  "5f22ae501f068f11fc397cb230046acc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloud-request)))
  "Returns md5sum for a message object of type 'PointCloud-request"
  "5f22ae501f068f11fc397cb230046acc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloud-request>)))
  "Returns full string definition for message of type '<PointCloud-request>"
  (cl:format cl:nil "uint32 flags~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloud-request)))
  "Returns full string definition for message of type 'PointCloud-request"
  (cl:format cl:nil "uint32 flags~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloud-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloud-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloud-request
    (cl:cons ':flags (flags msg))
))
;//! \htmlinclude PointCloud-response.msg.html

(cl:defclass <PointCloud-response> (roslisp-msg-protocol:ros-message)
  ((pointcloud
    :reader pointcloud
    :initarg :pointcloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass PointCloud-response (<PointCloud-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloud-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloud-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ptam_com-srv:<PointCloud-response> is deprecated: use ptam_com-srv:PointCloud-response instead.")))

(cl:ensure-generic-function 'pointcloud-val :lambda-list '(m))
(cl:defmethod pointcloud-val ((m <PointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ptam_com-srv:pointcloud-val is deprecated.  Use ptam_com-srv:pointcloud instead.")
  (pointcloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloud-response>) ostream)
  "Serializes a message object of type '<PointCloud-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointcloud) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloud-response>) istream)
  "Deserializes a message object of type '<PointCloud-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointcloud) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloud-response>)))
  "Returns string type for a service object of type '<PointCloud-response>"
  "ptam_com/PointCloudResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud-response)))
  "Returns string type for a service object of type 'PointCloud-response"
  "ptam_com/PointCloudResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloud-response>)))
  "Returns md5sum for a message object of type '<PointCloud-response>"
  "5f22ae501f068f11fc397cb230046acc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloud-response)))
  "Returns md5sum for a message object of type 'PointCloud-response"
  "5f22ae501f068f11fc397cb230046acc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloud-response>)))
  "Returns full string definition for message of type '<PointCloud-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 pointcloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloud-response)))
  "Returns full string definition for message of type 'PointCloud-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 pointcloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloud-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointcloud))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloud-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloud-response
    (cl:cons ':pointcloud (pointcloud msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PointCloud)))
  'PointCloud-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PointCloud)))
  'PointCloud-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloud)))
  "Returns string type for a service object of type '<PointCloud>"
  "ptam_com/PointCloud")