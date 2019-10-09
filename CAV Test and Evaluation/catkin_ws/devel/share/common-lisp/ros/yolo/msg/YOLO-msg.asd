
(cl:in-package :asdf)

(defsystem "YOLO-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "YOLO" :depends-on ("_package_YOLO"))
    (:file "_package_YOLO" :depends-on ("_package"))
  ))