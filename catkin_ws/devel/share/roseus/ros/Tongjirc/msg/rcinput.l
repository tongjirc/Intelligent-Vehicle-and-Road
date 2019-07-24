;; Auto-generated. Do not edit!


(when (boundp 'tongjirc::rcinput)
  (if (not (find-package "TONGJIRC"))
    (make-package "TONGJIRC"))
  (shadow 'rcinput (find-package "TONGJIRC")))
(unless (find-package "TONGJIRC::RCINPUT")
  (make-package "TONGJIRC::RCINPUT"))

(in-package "ROS")
;;//! \htmlinclude rcinput.msg.html


(defclass tongjirc::rcinput
  :super ros::object
  :slots (_EngineInput _SteerInput ))

(defmethod tongjirc::rcinput
  (:init
   (&key
    ((:EngineInput __EngineInput) 0)
    ((:SteerInput __SteerInput) 0)
    )
   (send-super :init)
   (setq _EngineInput (round __EngineInput))
   (setq _SteerInput (round __SteerInput))
   self)
  (:EngineInput
   (&optional __EngineInput)
   (if __EngineInput (setq _EngineInput __EngineInput)) _EngineInput)
  (:SteerInput
   (&optional __SteerInput)
   (if __SteerInput (setq _SteerInput __SteerInput)) _SteerInput)
  (:serialization-length
   ()
   (+
    ;; int64 _EngineInput
    8
    ;; int64 _SteerInput
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _EngineInput
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _EngineInput (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _EngineInput) (= (length (_EngineInput . bv)) 2)) ;; bignum
              (write-long (ash (elt (_EngineInput . bv) 0) 0) s)
              (write-long (ash (elt (_EngineInput . bv) 1) -1) s))
             ((and (class _EngineInput) (= (length (_EngineInput . bv)) 1)) ;; big1
              (write-long (elt (_EngineInput . bv) 0) s)
              (write-long (if (>= _EngineInput 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _EngineInput s)(write-long (if (>= _EngineInput 0) 0 #xffffffff) s)))
     ;; int64 _SteerInput
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _SteerInput (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _SteerInput) (= (length (_SteerInput . bv)) 2)) ;; bignum
              (write-long (ash (elt (_SteerInput . bv) 0) 0) s)
              (write-long (ash (elt (_SteerInput . bv) 1) -1) s))
             ((and (class _SteerInput) (= (length (_SteerInput . bv)) 1)) ;; big1
              (write-long (elt (_SteerInput . bv) 0) s)
              (write-long (if (>= _SteerInput 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _SteerInput s)(write-long (if (>= _SteerInput 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _EngineInput
#+(or :alpha :irix6 :x86_64)
      (setf _EngineInput (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _EngineInput (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _SteerInput
#+(or :alpha :irix6 :x86_64)
      (setf _SteerInput (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _SteerInput (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get tongjirc::rcinput :md5sum-) "d8fc30fb11cc0f978b5dd3ea0ef06177")
(setf (get tongjirc::rcinput :datatype-) "tongjirc/rcinput")
(setf (get tongjirc::rcinput :definition-)
      "int64 EngineInput
int64 SteerInput

")



(provide :tongjirc/rcinput "d8fc30fb11cc0f978b5dd3ea0ef06177")


