;; Auto-generated. Do not edit!


(when (boundp 'viso2_ros::VisoInfo)
  (if (not (find-package "VISO2_ROS"))
    (make-package "VISO2_ROS"))
  (shadow 'VisoInfo (find-package "VISO2_ROS")))
(unless (find-package "VISO2_ROS::VISOINFO")
  (make-package "VISO2_ROS::VISOINFO"))

(in-package "ROS")
;;//! \htmlinclude VisoInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass viso2_ros::VisoInfo
  :super ros::object
  :slots (_header _got_lost _change_reference_frame _motion_estimate_valid _num_matches _num_inliers _runtime ))

(defmethod viso2_ros::VisoInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:got_lost __got_lost) nil)
    ((:change_reference_frame __change_reference_frame) nil)
    ((:motion_estimate_valid __motion_estimate_valid) nil)
    ((:num_matches __num_matches) 0)
    ((:num_inliers __num_inliers) 0)
    ((:runtime __runtime) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _got_lost __got_lost)
   (setq _change_reference_frame __change_reference_frame)
   (setq _motion_estimate_valid __motion_estimate_valid)
   (setq _num_matches (round __num_matches))
   (setq _num_inliers (round __num_inliers))
   (setq _runtime (float __runtime))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:got_lost
   (&optional __got_lost)
   (if __got_lost (setq _got_lost __got_lost)) _got_lost)
  (:change_reference_frame
   (&optional __change_reference_frame)
   (if __change_reference_frame (setq _change_reference_frame __change_reference_frame)) _change_reference_frame)
  (:motion_estimate_valid
   (&optional __motion_estimate_valid)
   (if __motion_estimate_valid (setq _motion_estimate_valid __motion_estimate_valid)) _motion_estimate_valid)
  (:num_matches
   (&optional __num_matches)
   (if __num_matches (setq _num_matches __num_matches)) _num_matches)
  (:num_inliers
   (&optional __num_inliers)
   (if __num_inliers (setq _num_inliers __num_inliers)) _num_inliers)
  (:runtime
   (&optional __runtime)
   (if __runtime (setq _runtime __runtime)) _runtime)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _got_lost
    1
    ;; bool _change_reference_frame
    1
    ;; bool _motion_estimate_valid
    1
    ;; int32 _num_matches
    4
    ;; int32 _num_inliers
    4
    ;; float64 _runtime
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _got_lost
       (if _got_lost (write-byte -1 s) (write-byte 0 s))
     ;; bool _change_reference_frame
       (if _change_reference_frame (write-byte -1 s) (write-byte 0 s))
     ;; bool _motion_estimate_valid
       (if _motion_estimate_valid (write-byte -1 s) (write-byte 0 s))
     ;; int32 _num_matches
       (write-long _num_matches s)
     ;; int32 _num_inliers
       (write-long _num_inliers s)
     ;; float64 _runtime
       (sys::poke _runtime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _got_lost
     (setq _got_lost (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _change_reference_frame
     (setq _change_reference_frame (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _motion_estimate_valid
     (setq _motion_estimate_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _num_matches
     (setq _num_matches (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num_inliers
     (setq _num_inliers (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _runtime
     (setq _runtime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get viso2_ros::VisoInfo :md5sum-) "765500d8b83bf74f7715c6e2e8e89092")
(setf (get viso2_ros::VisoInfo :datatype-) "viso2_ros/VisoInfo")
(setf (get viso2_ros::VisoInfo :definition-)
      "# Internal information on the
# viso2 algorithm parameters
# and results

Header header

# True if the previous iteration of viso2
# was not able to complete the matching process
# therefore the visual odometer is re-started.
bool got_lost

# True if in the next run the reference 
# frame will be changed. This is the case
# when the number of inliers drops below
# a threshold or the previous motion estimate
# failed in last motion estimation.
bool change_reference_frame

# info from motion estimator
bool motion_estimate_valid
int32 num_matches
int32 num_inliers

# runtime of last iteration in seconds
float64 runtime

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

")



(provide :viso2_ros/VisoInfo "765500d8b83bf74f7715c6e2e8e89092")


