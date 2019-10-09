;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::OctoMapPointArray)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'OctoMapPointArray (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::OCTOMAPPOINTARRAY")
  (make-package "PTAM_COM::OCTOMAPPOINTARRAY"))

(in-package "ROS")
;;//! \htmlinclude OctoMapPointArray.msg.html


(defclass ptam_com::OctoMapPointArray
  :super ros::object
  :slots (_mapPoints ))

(defmethod ptam_com::OctoMapPointArray
  (:init
   (&key
    ((:mapPoints __mapPoints) (let (r) (dotimes (i 0) (push (instance ptam_com::OctoMapPointStamped :init) r)) r))
    )
   (send-super :init)
   (setq _mapPoints __mapPoints)
   self)
  (:mapPoints
   (&rest __mapPoints)
   (if (keywordp (car __mapPoints))
       (send* _mapPoints __mapPoints)
     (progn
       (if __mapPoints (setq _mapPoints (car __mapPoints)))
       _mapPoints)))
  (:serialization-length
   ()
   (+
    ;; ptam_com/OctoMapPointStamped[] _mapPoints
    (apply #'+ (send-all _mapPoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ptam_com/OctoMapPointStamped[] _mapPoints
     (write-long (length _mapPoints) s)
     (dolist (elem _mapPoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ptam_com/OctoMapPointStamped[] _mapPoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mapPoints (let (r) (dotimes (i n) (push (instance ptam_com::OctoMapPointStamped :init) r)) r))
     (dolist (elem- _mapPoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ptam_com::OctoMapPointArray :md5sum-) "f65418a8cd445702b4ff05d157c76c47")
(setf (get ptam_com::OctoMapPointArray :datatype-) "ptam_com/OctoMapPointArray")
(setf (get ptam_com::OctoMapPointArray :definition-)
      "OctoMapPointStamped[] mapPoints

================================================================================
MSG: ptam_com/OctoMapPointStamped
Header header
uint8 INSERT = 0
uint8 UPDATE = 1
uint8 DELETE = 2

uint8 action
geometry_msgs/Vector3 position

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
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :ptam_com/OctoMapPointArray "f65418a8cd445702b4ff05d157c76c47")


