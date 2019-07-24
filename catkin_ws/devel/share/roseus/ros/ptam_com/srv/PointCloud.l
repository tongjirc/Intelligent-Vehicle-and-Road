;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::PointCloud)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'PointCloud (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::POINTCLOUD")
  (make-package "PTAM_COM::POINTCLOUD"))
(unless (find-package "PTAM_COM::POINTCLOUDREQUEST")
  (make-package "PTAM_COM::POINTCLOUDREQUEST"))
(unless (find-package "PTAM_COM::POINTCLOUDRESPONSE")
  (make-package "PTAM_COM::POINTCLOUDRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass ptam_com::PointCloudRequest
  :super ros::object
  :slots (_flags ))

(defmethod ptam_com::PointCloudRequest
  (:init
   (&key
    ((:flags __flags) 0)
    )
   (send-super :init)
   (setq _flags (round __flags))
   self)
  (:flags
   (&optional __flags)
   (if __flags (setq _flags __flags)) _flags)
  (:serialization-length
   ()
   (+
    ;; uint32 _flags
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _flags
       (write-long _flags s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _flags
     (setq _flags (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass ptam_com::PointCloudResponse
  :super ros::object
  :slots (_pointcloud ))

(defmethod ptam_com::PointCloudResponse
  (:init
   (&key
    ((:pointcloud __pointcloud) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _pointcloud __pointcloud)
   self)
  (:pointcloud
   (&rest __pointcloud)
   (if (keywordp (car __pointcloud))
       (send* _pointcloud __pointcloud)
     (progn
       (if __pointcloud (setq _pointcloud (car __pointcloud)))
       _pointcloud)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _pointcloud
    (send _pointcloud :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _pointcloud
       (send _pointcloud :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _pointcloud
     (send _pointcloud :deserialize buf ptr-) (incf ptr- (send _pointcloud :serialization-length))
   ;;
   self)
  )

(defclass ptam_com::PointCloud
  :super ros::object
  :slots ())

(setf (get ptam_com::PointCloud :md5sum-) "5f22ae501f068f11fc397cb230046acc")
(setf (get ptam_com::PointCloud :datatype-) "ptam_com/PointCloud")
(setf (get ptam_com::PointCloud :request) ptam_com::PointCloudRequest)
(setf (get ptam_com::PointCloud :response) ptam_com::PointCloudResponse)

(defmethod ptam_com::PointCloudRequest
  (:response () (instance ptam_com::PointCloudResponse :init)))

(setf (get ptam_com::PointCloudRequest :md5sum-) "5f22ae501f068f11fc397cb230046acc")
(setf (get ptam_com::PointCloudRequest :datatype-) "ptam_com/PointCloudRequest")
(setf (get ptam_com::PointCloudRequest :definition-)
      "uint32 flags
---
sensor_msgs/PointCloud2 pointcloud


================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
")

(setf (get ptam_com::PointCloudResponse :md5sum-) "5f22ae501f068f11fc397cb230046acc")
(setf (get ptam_com::PointCloudResponse :datatype-) "ptam_com/PointCloudResponse")
(setf (get ptam_com::PointCloudResponse :definition-)
      "uint32 flags
---
sensor_msgs/PointCloud2 pointcloud


================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
")



(provide :ptam_com/PointCloud "5f22ae501f068f11fc397cb230046acc")


