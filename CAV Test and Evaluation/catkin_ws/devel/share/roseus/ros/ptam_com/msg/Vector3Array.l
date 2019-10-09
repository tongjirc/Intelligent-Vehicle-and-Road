;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::Vector3Array)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'Vector3Array (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::VECTOR3ARRAY")
  (make-package "PTAM_COM::VECTOR3ARRAY"))

(in-package "ROS")
;;//! \htmlinclude Vector3Array.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ptam_com::Vector3Array
  :super ros::object
  :slots (_header _vector3 ))

(defmethod ptam_com::Vector3Array
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vector3 __vector3) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Vector3 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _vector3 __vector3)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vector3
   (&rest __vector3)
   (if (keywordp (car __vector3))
       (send* _vector3 __vector3)
     (progn
       (if __vector3 (setq _vector3 (car __vector3)))
       _vector3)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3[] _vector3
    (apply #'+ (send-all _vector3 :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3[] _vector3
     (write-long (length _vector3) s)
     (dolist (elem _vector3)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3[] _vector3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vector3 (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _vector3)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ptam_com::Vector3Array :md5sum-) "7bf65100ecb1863f26514d20169e41a1")
(setf (get ptam_com::Vector3Array :datatype-) "ptam_com/Vector3Array")
(setf (get ptam_com::Vector3Array :definition-)
      "Header header
geometry_msgs/Vector3[] vector3
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



(provide :ptam_com/Vector3Array "7bf65100ecb1863f26514d20169e41a1")


