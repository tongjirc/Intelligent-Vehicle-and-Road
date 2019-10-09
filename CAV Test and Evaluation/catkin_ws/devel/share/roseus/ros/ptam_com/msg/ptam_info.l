;; Auto-generated. Do not edit!


(when (boundp 'ptam_com::ptam_info)
  (if (not (find-package "PTAM_COM"))
    (make-package "PTAM_COM"))
  (shadow 'ptam_info (find-package "PTAM_COM")))
(unless (find-package "PTAM_COM::PTAM_INFO")
  (make-package "PTAM_COM::PTAM_INFO"))

(in-package "ROS")
;;//! \htmlinclude ptam_info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ptam_com::ptam_info
  :super ros::object
  :slots (_header _fps _keyframes _trackingQuality _mapQuality _mapViewerMessage _trackerMessage ))

(defmethod ptam_com::ptam_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:fps __fps) 0.0)
    ((:keyframes __keyframes) 0)
    ((:trackingQuality __trackingQuality) 0)
    ((:mapQuality __mapQuality) nil)
    ((:mapViewerMessage __mapViewerMessage) "")
    ((:trackerMessage __trackerMessage) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _fps (float __fps))
   (setq _keyframes (round __keyframes))
   (setq _trackingQuality (round __trackingQuality))
   (setq _mapQuality __mapQuality)
   (setq _mapViewerMessage (string __mapViewerMessage))
   (setq _trackerMessage (string __trackerMessage))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:fps
   (&optional __fps)
   (if __fps (setq _fps __fps)) _fps)
  (:keyframes
   (&optional __keyframes)
   (if __keyframes (setq _keyframes __keyframes)) _keyframes)
  (:trackingQuality
   (&optional __trackingQuality)
   (if __trackingQuality (setq _trackingQuality __trackingQuality)) _trackingQuality)
  (:mapQuality
   (&optional __mapQuality)
   (if __mapQuality (setq _mapQuality __mapQuality)) _mapQuality)
  (:mapViewerMessage
   (&optional __mapViewerMessage)
   (if __mapViewerMessage (setq _mapViewerMessage __mapViewerMessage)) _mapViewerMessage)
  (:trackerMessage
   (&optional __trackerMessage)
   (if __trackerMessage (setq _trackerMessage __trackerMessage)) _trackerMessage)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _fps
    4
    ;; int32 _keyframes
    4
    ;; int32 _trackingQuality
    4
    ;; bool _mapQuality
    1
    ;; string _mapViewerMessage
    4 (length _mapViewerMessage)
    ;; string _trackerMessage
    4 (length _trackerMessage)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _fps
       (sys::poke _fps (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _keyframes
       (write-long _keyframes s)
     ;; int32 _trackingQuality
       (write-long _trackingQuality s)
     ;; bool _mapQuality
       (if _mapQuality (write-byte -1 s) (write-byte 0 s))
     ;; string _mapViewerMessage
       (write-long (length _mapViewerMessage) s) (princ _mapViewerMessage s)
     ;; string _trackerMessage
       (write-long (length _trackerMessage) s) (princ _trackerMessage s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _fps
     (setq _fps (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _keyframes
     (setq _keyframes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _trackingQuality
     (setq _trackingQuality (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _mapQuality
     (setq _mapQuality (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _mapViewerMessage
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mapViewerMessage (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _trackerMessage
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trackerMessage (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ptam_com::ptam_info :md5sum-) "798e178ae56263a37e464710cafb5ffc")
(setf (get ptam_com::ptam_info :datatype-) "ptam_com/ptam_info")
(setf (get ptam_com::ptam_info :definition-)
      "Header      header
float32     fps
int32       keyframes
int32       trackingQuality
bool        mapQuality
string      mapViewerMessage
string      trackerMessage
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



(provide :ptam_com/ptam_info "798e178ae56263a37e464710cafb5ffc")


