execute_process(COMMAND "/home/tongjirc/catkin_ws/build/ROS-SLAM-Gmapping/ros_arduino_bridge/ros_arduino_python/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/tongjirc/catkin_ws/build/ROS-SLAM-Gmapping/ros_arduino_bridge/ros_arduino_python/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
