;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::beacon_pos_a)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'beacon_pos_a (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::BEACON_POS_A")
  (make-package "MARVELMIND_NAV::BEACON_POS_A"))

(in-package "ROS")
;;//! \htmlinclude beacon_pos_a.msg.html


(defclass marvelmind_nav::beacon_pos_a
  :super ros::object
  :slots (_address _x_m _y_m _z_m ))

(defmethod marvelmind_nav::beacon_pos_a
  (:init
   (&key
    ((:address __address) 0)
    ((:x_m __x_m) 0.0)
    ((:y_m __y_m) 0.0)
    ((:z_m __z_m) 0.0)
    )
   (send-super :init)
   (setq _address (round __address))
   (setq _x_m (float __x_m))
   (setq _y_m (float __y_m))
   (setq _z_m (float __z_m))
   self)
  (:address
   (&optional __address)
   (if __address (setq _address __address)) _address)
  (:x_m
   (&optional __x_m)
   (if __x_m (setq _x_m __x_m)) _x_m)
  (:y_m
   (&optional __y_m)
   (if __y_m (setq _y_m __y_m)) _y_m)
  (:z_m
   (&optional __z_m)
   (if __z_m (setq _z_m __z_m)) _z_m)
  (:serialization-length
   ()
   (+
    ;; uint8 _address
    1
    ;; float64 _x_m
    8
    ;; float64 _y_m
    8
    ;; float64 _z_m
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _address
       (write-byte _address s)
     ;; float64 _x_m
       (sys::poke _x_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_m
       (sys::poke _y_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_m
       (sys::poke _z_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _address
     (setq _address (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _x_m
     (setq _x_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_m
     (setq _y_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_m
     (setq _z_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get marvelmind_nav::beacon_pos_a :md5sum-) "2ebe9b8512406c92c2dbfed7a627f03c")
(setf (get marvelmind_nav::beacon_pos_a :datatype-) "marvelmind_nav/beacon_pos_a")
(setf (get marvelmind_nav::beacon_pos_a :definition-)
      "uint8 address
float64 x_m
float64 y_m
float64 z_m

")



(provide :marvelmind_nav/beacon_pos_a "2ebe9b8512406c92c2dbfed7a627f03c")


