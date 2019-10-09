;; Auto-generated. Do not edit!


(when (boundp 'YOLO::YOLO)
  (if (not (find-package "YOLO"))
    (make-package "YOLO"))
  (shadow 'YOLO (find-package "YOLO")))
(unless (find-package "YOLO::YOLO")
  (make-package "YOLO::YOLO"))

(in-package "ROS")
;;//! \htmlinclude YOLO.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass YOLO::YOLO
  :super ros::object
  :slots (_header _classIds _confidences _boxes4 ))

(defmethod YOLO::YOLO
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:classIds __classIds) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidences __confidences) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:boxes4 __boxes4) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _classIds __classIds)
   (setq _confidences __confidences)
   (setq _boxes4 __boxes4)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:classIds
   (&optional __classIds)
   (if __classIds (setq _classIds __classIds)) _classIds)
  (:confidences
   (&optional __confidences)
   (if __confidences (setq _confidences __confidences)) _confidences)
  (:boxes4
   (&optional __boxes4)
   (if __boxes4 (setq _boxes4 __boxes4)) _boxes4)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _classIds
    (* 8    (length _classIds)) 4
    ;; float64[] _confidences
    (* 8    (length _confidences)) 4
    ;; uint8[] _boxes4
    (* 1    (length _boxes4)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _classIds
     (write-long (length _classIds) s)
     (dotimes (i (length _classIds))
       (sys::poke (elt _classIds i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _confidences
     (write-long (length _confidences) s)
     (dotimes (i (length _confidences))
       (sys::poke (elt _confidences i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; uint8[] _boxes4
     (write-long (length _boxes4) s)
     (princ _boxes4 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _classIds
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _classIds (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _classIds i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _confidences
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidences (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidences i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; uint8[] _boxes4
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _boxes4 (make-array n :element-type :char))
     (replace _boxes4 buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get YOLO::YOLO :md5sum-) "71d52b23e2f4848dfc8e90e1502e429b")
(setf (get YOLO::YOLO :datatype-) "YOLO/YOLO")
(setf (get YOLO::YOLO :definition-)
      "
std_msgs/Header header

#classIds,confidences,boxes(left, top, width, height)

float64[] classIds
float64[] confidences
#boxes.flat()
uint8[] boxes4

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



(provide :YOLO/YOLO "71d52b23e2f4848dfc8e90e1502e429b")


