;; Auto-generated. Do not edit!


(when (boundp 'output::output)
  (if (not (find-package "OUTPUT"))
    (make-package "OUTPUT"))
  (shadow 'output (find-package "OUTPUT")))
(unless (find-package "OUTPUT::OUTPUT")
  (make-package "OUTPUT::OUTPUT"))

(in-package "ROS")
;;//! \htmlinclude output.msg.html


(defclass output::output
  :super ros::object
  :slots (_state _motor _steer ))

(defmethod output::output
  (:init
   (&key
    ((:state __state) 0)
    ((:motor __motor) 0.0)
    ((:steer __steer) 0.0)
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _motor (float __motor))
   (setq _steer (float __steer))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:motor
   (&optional __motor)
   (if __motor (setq _motor __motor)) _motor)
  (:steer
   (&optional __steer)
   (if __steer (setq _steer __steer)) _steer)
  (:serialization-length
   ()
   (+
    ;; int8 _state
    1
    ;; float64 _motor
    8
    ;; float64 _steer
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _state
       (write-byte _state s)
     ;; float64 _motor
       (sys::poke _motor (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steer
       (sys::poke _steer (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _state 127) (setq _state (- _state 256)))
   ;; float64 _motor
     (setq _motor (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steer
     (setq _steer (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get output::output :md5sum-) "e65caaa63c403a0af0f3267ca901c242")
(setf (get output::output :datatype-) "output/output")
(setf (get output::output :definition-)
      "int8 state
float64 motor
float64 steer

")



(provide :output/output "e65caaa63c403a0af0f3267ca901c242")


