;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::hedge_imu_fusion)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'hedge_imu_fusion (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::HEDGE_IMU_FUSION")
  (make-package "MARVELMIND_NAV::HEDGE_IMU_FUSION"))

(in-package "ROS")
;;//! \htmlinclude hedge_imu_fusion.msg.html


(defclass marvelmind_nav::hedge_imu_fusion
  :super ros::object
  :slots (_timestamp_ms _x_m _y_m _z_m _qw _qx _qy _qz _vx _vy _vz _ax _ay _az ))

(defmethod marvelmind_nav::hedge_imu_fusion
  (:init
   (&key
    ((:timestamp_ms __timestamp_ms) 0)
    ((:x_m __x_m) 0.0)
    ((:y_m __y_m) 0.0)
    ((:z_m __z_m) 0.0)
    ((:qw __qw) 0.0)
    ((:qx __qx) 0.0)
    ((:qy __qy) 0.0)
    ((:qz __qz) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    ((:ax __ax) 0.0)
    ((:ay __ay) 0.0)
    ((:az __az) 0.0)
    )
   (send-super :init)
   (setq _timestamp_ms (round __timestamp_ms))
   (setq _x_m (float __x_m))
   (setq _y_m (float __y_m))
   (setq _z_m (float __z_m))
   (setq _qw (float __qw))
   (setq _qx (float __qx))
   (setq _qy (float __qy))
   (setq _qz (float __qz))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vz (float __vz))
   (setq _ax (float __ax))
   (setq _ay (float __ay))
   (setq _az (float __az))
   self)
  (:timestamp_ms
   (&optional __timestamp_ms)
   (if __timestamp_ms (setq _timestamp_ms __timestamp_ms)) _timestamp_ms)
  (:x_m
   (&optional __x_m)
   (if __x_m (setq _x_m __x_m)) _x_m)
  (:y_m
   (&optional __y_m)
   (if __y_m (setq _y_m __y_m)) _y_m)
  (:z_m
   (&optional __z_m)
   (if __z_m (setq _z_m __z_m)) _z_m)
  (:qw
   (&optional __qw)
   (if __qw (setq _qw __qw)) _qw)
  (:qx
   (&optional __qx)
   (if __qx (setq _qx __qx)) _qx)
  (:qy
   (&optional __qy)
   (if __qy (setq _qy __qy)) _qy)
  (:qz
   (&optional __qz)
   (if __qz (setq _qz __qz)) _qz)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:serialization-length
   ()
   (+
    ;; int64 _timestamp_ms
    8
    ;; float64 _x_m
    8
    ;; float64 _y_m
    8
    ;; float64 _z_m
    8
    ;; float64 _qw
    8
    ;; float64 _qx
    8
    ;; float64 _qy
    8
    ;; float64 _qz
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _vz
    8
    ;; float64 _ax
    8
    ;; float64 _ay
    8
    ;; float64 _az
    8
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
     ;; float64 _x_m
       (sys::poke _x_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_m
       (sys::poke _y_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_m
       (sys::poke _z_m (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qw
       (sys::poke _qw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qx
       (sys::poke _qx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qy
       (sys::poke _qy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _qz
       (sys::poke _qz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ax
       (sys::poke _ax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ay
       (sys::poke _ay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _az
       (sys::poke _az (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _x_m
     (setq _x_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_m
     (setq _y_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_m
     (setq _z_m (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qw
     (setq _qw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qx
     (setq _qx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qy
     (setq _qy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _qz
     (setq _qz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vz
     (setq _vz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ax
     (setq _ax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ay
     (setq _ay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _az
     (setq _az (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get marvelmind_nav::hedge_imu_fusion :md5sum-) "80fa4231724bd716826855f463bf5400")
(setf (get marvelmind_nav::hedge_imu_fusion :datatype-) "marvelmind_nav/hedge_imu_fusion")
(setf (get marvelmind_nav::hedge_imu_fusion :definition-)
      "int64 timestamp_ms
float64 x_m
float64 y_m
float64 z_m
float64 qw
float64 qx
float64 qy
float64 qz
float64 vx
float64 vy
float64 vz
float64 ax
float64 ay
float64 az


")



(provide :marvelmind_nav/hedge_imu_fusion "80fa4231724bd716826855f463bf5400")


