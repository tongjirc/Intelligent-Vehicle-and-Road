
(cl:in-package :asdf)

(defsystem "ptam_com-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "KeyFrame_msg" :depends-on ("_package_KeyFrame_msg"))
    (:file "_package_KeyFrame_msg" :depends-on ("_package"))
    (:file "OctoMapPointArray" :depends-on ("_package_OctoMapPointArray"))
    (:file "_package_OctoMapPointArray" :depends-on ("_package"))
    (:file "OctoMapPointStamped" :depends-on ("_package_OctoMapPointStamped"))
    (:file "_package_OctoMapPointStamped" :depends-on ("_package"))
    (:file "OctoMapScan" :depends-on ("_package_OctoMapScan"))
    (:file "_package_OctoMapScan" :depends-on ("_package"))
    (:file "Vector3Array" :depends-on ("_package_Vector3Array"))
    (:file "_package_Vector3Array" :depends-on ("_package"))
    (:file "ptam_info" :depends-on ("_package_ptam_info"))
    (:file "_package_ptam_info" :depends-on ("_package"))
  ))