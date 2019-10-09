;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::beacon_distance)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'beacon_distance (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::BEACON_DISTANCE")
  (make-package "MARVELMIND_NAV::BEACON_DISTANCE"))

(in-package "ROS")
;;//! \htmlinclude beacon_distance.msg.html


(defclass marvelmind_nav::beacon_distance
  :super ros::object
  :slots (_address_hedge _address_beacon _distance_m ))

(defmethod marvelmind_nav::beacon_distance
  (:init
   (&key
    ((:address_hedge __address_hedge) 0)
    ((:address_beacon __address_beacon) 0)
    ((:distance_m __distance_m) 0.0)
    )
   (send-super :init)
   (setq _address_hedge (round __address_hedge))
   (setq _address_beacon (round __address_beacon))
   (setq _distance_m (float __distance_m))
   self)
  (:address_hedge
   (&optional __address_hedge)
   (if __address_hedge (setq _address_hedge __address_hedge)) _address_hedge)
  (:address_beacon
   (&optional __address_beacon)
   (if __address_beacon (setq _address_beacon __address_beacon)) _address_beacon)
  (:distance_m
   (&optional __distance_m)
   (if __distance_m (setq _distance_m __distance_m)) _distance_m)
  (:serialization-length
   ()
   (+
    ;; uint8 _address_hedge
    1
    ;; uint8 _address_beacon
    1
    ;; float64 _distance_m
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _address_hedge
       (write-byte _address_hedge s)
     ;; uint8 _address_beacon
       (write-byte _address_beacon s)
     ;; float64 _distance_m
       (sys::poke _distance_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _address_hedge
     (setq _address_hedge (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _address_beacon
     (setq _address_beacon (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _distance_m
     (setq _distance_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get marvelmind_nav::beacon_distance :md5sum-) "0961792211a42c14a3b38a49e24931f3")
(setf (get marvelmind_nav::beacon_distance :datatype-) "marvelmind_nav/beacon_distance")
(setf (get marvelmind_nav::beacon_distance :definition-)
      "uint8 address_hedge
uint8 address_beacon
float64 distance_m

")



(provide :marvelmind_nav/beacon_distance "0961792211a42c14a3b38a49e24931f3")


