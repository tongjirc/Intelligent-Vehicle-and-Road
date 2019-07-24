
(cl:in-package :asdf)

(defsystem "tongjirc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "tongjircAction" :depends-on ("_package_tongjircAction"))
    (:file "_package_tongjircAction" :depends-on ("_package"))
    (:file "tongjircActionFeedback" :depends-on ("_package_tongjircActionFeedback"))
    (:file "_package_tongjircActionFeedback" :depends-on ("_package"))
    (:file "tongjircActionGoal" :depends-on ("_package_tongjircActionGoal"))
    (:file "_package_tongjircActionGoal" :depends-on ("_package"))
    (:file "tongjircActionResult" :depends-on ("_package_tongjircActionResult"))
    (:file "_package_tongjircActionResult" :depends-on ("_package"))
    (:file "tongjircFeedback" :depends-on ("_package_tongjircFeedback"))
    (:file "_package_tongjircFeedback" :depends-on ("_package"))
    (:file "tongjircGoal" :depends-on ("_package_tongjircGoal"))
    (:file "_package_tongjircGoal" :depends-on ("_package"))
    (:file "tongjircResult" :depends-on ("_package_tongjircResult"))
    (:file "_package_tongjircResult" :depends-on ("_package"))
  ))