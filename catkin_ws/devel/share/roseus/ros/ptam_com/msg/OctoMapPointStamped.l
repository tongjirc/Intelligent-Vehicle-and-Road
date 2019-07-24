;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::OctoMapPointStamped)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'OctoMapPointStamped (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED")
  (make-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude OctoMapPointStamped.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*INSERT*" (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(shadow '*INSERT* (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(defconstant ptam_com::OctoMapPointStamped::*INSERT* 0)
(intern "*UPDATE*" (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(shadow '*UPDATE* (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(defconstant ptam_com::OctoMapPointStamped::*UPDATE* 1)
(intern "*DELETE*" (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(shadow '*DELETE* (find-package "PTAM_COM::OCTOMAPPOINTSTAMPED"))
(defconstant ptam_com::OctoMapPointStamped::*DELETE* 2)
(defclass ptam_com::OctoMapPointStamped
  :super ros::object
  :slots (_header _action _position ))

(defmethod ptam_com::OctoMapPointStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action __action) 0)
    ((:position __position) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _action (round __action))
   (setq _position __position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _action
    1
    ;; geometry_msgs/Vector3 _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _action
       (write-byte _action s)
     ;; geometry_msgs/Vector3 _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _action
     (setq _action (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Vector3 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get ptam_com::OctoMapPointStamped :md5sum-) "261f3d921672cadc0daf48420ac709b5")
(setf (get ptam_com::OctoMapPointStamped :datatype-) "ptam_com/OctoMapPointStamped")
(setf (get ptam_com::OctoMapPointStamped :definition-)
      "Header header
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



(provide :ptam_com/OctoMapPointStamped "261f3d921672cadc0daf48420ac709b5")


