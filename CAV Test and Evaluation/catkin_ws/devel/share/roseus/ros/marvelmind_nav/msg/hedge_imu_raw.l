;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::hedge_imu_raw)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'hedge_imu_raw (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::HEDGE_IMU_RAW")
  (make-package "MARVELMIND_NAV::HEDGE_IMU_RAW"))

(in-package "ROS")
;;//! \htmlinclude hedge_imu_raw.msg.html


(defclass marvelmind_nav::hedge_imu_raw
  :super ros::object
  :slots (_timestamp_ms _acc_x _acc_y _acc_z _gyro_x _gyro_y _gyro_z _compass_x _compass_y _compass_z ))

(defmethod marvelmind_nav::hedge_imu_raw
  (:init
   (&key
    ((:timestamp_ms __timestamp_ms) 0)
    ((:acc_x __acc_x) 0)
    ((:acc_y __acc_y) 0)
    ((:acc_z __acc_z) 0)
    ((:gyro_x __gyro_x) 0)
    ((:gyro_y __gyro_y) 0)
    ((:gyro_z __gyro_z) 0)
    ((:compass_x __compass_x) 0)
    ((:compass_y __compass_y) 0)
    ((:compass_z __compass_z) 0)
    )
   (send-super :init)
   (setq _timestamp_ms (round __timestamp_ms))
   (setq _acc_x (round __acc_x))
   (setq _acc_y (round __acc_y))
   (setq _acc_z (round __acc_z))
   (setq _gyro_x (round __gyro_x))
   (setq _gyro_y (round __gyro_y))
   (setq _gyro_z (round __gyro_z))
   (setq _compass_x (round __compass_x))
   (setq _compass_y (round __compass_y))
   (setq _compass_z (round __compass_z))
   self)
  (:timestamp_ms
   (&optional __timestamp_ms)
   (if __timestamp_ms (setq _timestamp_ms __timestamp_ms)) _timestamp_ms)
  (:acc_x
   (&optional __acc_x)
   (if __acc_x (setq _acc_x __acc_x)) _acc_x)
  (:acc_y
   (&optional __acc_y)
   (if __acc_y (setq _acc_y __acc_y)) _acc_y)
  (:acc_z
   (&optional __acc_z)
   (if __acc_z (setq _acc_z __acc_z)) _acc_z)
  (:gyro_x
   (&optional __gyro_x)
   (if __gyro_x (setq _gyro_x __gyro_x)) _gyro_x)
  (:gyro_y
   (&optional __gyro_y)
   (if __gyro_y (setq _gyro_y __gyro_y)) _gyro_y)
  (:gyro_z
   (&optional __gyro_z)
   (if __gyro_z (setq _gyro_z __gyro_z)) _gyro_z)
  (:compass_x
   (&optional __compass_x)
   (if __compass_x (setq _compass_x __compass_x)) _compass_x)
  (:compass_y
   (&optional __compass_y)
   (if __compass_y (setq _compass_y __compass_y)) _compass_y)
  (:compass_z
   (&optional __compass_z)
   (if __compass_z (setq _compass_z __compass_z)) _compass_z)
  (:serialization-length
   ()
   (+
    ;; int64 _timestamp_ms
    8
    ;; int16 _acc_x
    2
    ;; int16 _acc_y
    2
    ;; int16 _acc_z
    2
    ;; int16 _gyro_x
    2
    ;; int16 _gyro_y
    2
    ;; int16 _gyro_z
    2
    ;; int16 _compass_x
    2
    ;; int16 _compass_y
    2
    ;; int16 _compass_z
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _timestamp_ms
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp_ms (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp_ms) (= (length (_timestamp_ms . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp_ms . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp_ms . bv) 1) -1) s))
             ((and (class _timestamp_ms) (= (length (_timestamp_ms . bv)) 1)) ;; big1
              (write-long (elt (_timestamp_ms . bv) 0) s)
              (write-long (if (>= _timestamp_ms 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp_ms s)(write-long (if (>= _timestamp_ms 0) 0 #xffffffff) s)))
     ;; int16 _acc_x
       (write-word _acc_x s)
     ;; int16 _acc_y
       (write-word _acc_y s)
     ;; int16 _acc_z
       (write-word _acc_z s)
     ;; int16 _gyro_x
       (write-word _gyro_x s)
     ;; int16 _gyro_y
       (write-word _gyro_y s)
     ;; int16 _gyro_z
       (write-word _gyro_z s)
     ;; int16 _compass_x
       (write-word _compass_x s)
     ;; int16 _compass_y
       (write-word _compass_y s)
     ;; int16 _compass_z
       (write-word _compass_z s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _timestamp_ms
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp_ms (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp_ms (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int16 _acc_x
     (setq _acc_x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acc_y
     (setq _acc_y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acc_z
     (setq _acc_z (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gyro_x
     (setq _gyro_x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gyro_y
     (setq _gyro_y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _gyro_z
     (setq _gyro_z (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _compass_x
     (setq _compass_x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _compass_y
     (setq _compass_y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _compass_z
     (setq _compass_z (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get marvelmind_nav::hedge_imu_raw :md5sum-) "809304d028f09940bd722db544d5d2e8")
(setf (get marvelmind_nav::hedge_imu_raw :datatype-) "marvelmind_nav/hedge_imu_raw")
(setf (get marvelmind_nav::hedge_imu_raw :definition-)
      "int64 timestamp_ms
int16 acc_x
int16 acc_y
int16 acc_z
int16 gyro_x
int16 gyro_y
int16 gyro_z
int16 compass_x
int16 compass_y
int16 compass_z

")



(provide :marvelmind_nav/hedge_imu_raw "809304d028f09940bd722db544d5d2e8")


