
(cl:in-package :asdf)

(defsystem "ptam_com-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "KeyFrame_srv" :depends-on ("_package_KeyFrame_srv"))
    (:file "_package_KeyFrame_srv" :depends-on ("_package"))
    (:file "PointCloud" :depends-on ("_package_PointCloud"))
    (:file "_package_PointCloud" :depends-on ("_package"))
  ))