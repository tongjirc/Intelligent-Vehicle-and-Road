# Install script for directory: /home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tongjirc/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com/msg" TYPE FILE FILES
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/KeyFrame_msg.msg"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/OctoMapPointArray.msg"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/OctoMapPointStamped.msg"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/OctoMapScan.msg"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/Vector3Array.msg"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg/ptam_info.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com/srv" TYPE FILE FILES
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/srv/KeyFrame_srv.srv"
    "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/srv/PointCloud.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com/cmake" TYPE FILE FILES "/home/tongjirc/catkin_ws/build/ethzasl_ptam/ptam_com/catkin_generated/installspace/ptam_com-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/tongjirc/catkin_ws/devel/include/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/tongjirc/catkin_ws/devel/share/roseus/ros/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/tongjirc/catkin_ws/devel/share/common-lisp/ros/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/tongjirc/catkin_ws/devel/share/gennodejs/ros/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/tongjirc/catkin_ws/devel/lib/python2.7/dist-packages/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/tongjirc/catkin_ws/devel/lib/python2.7/dist-packages/ptam_com")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tongjirc/catkin_ws/build/ethzasl_ptam/ptam_com/catkin_generated/installspace/ptam_com.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com/cmake" TYPE FILE FILES "/home/tongjirc/catkin_ws/build/ethzasl_ptam/ptam_com/catkin_generated/installspace/ptam_com-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com/cmake" TYPE FILE FILES
    "/home/tongjirc/catkin_ws/build/ethzasl_ptam/ptam_com/catkin_generated/installspace/ptam_comConfig.cmake"
    "/home/tongjirc/catkin_ws/build/ethzasl_ptam/ptam_com/catkin_generated/installspace/ptam_comConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ptam_com" TYPE FILE FILES "/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/package.xml")
endif()

