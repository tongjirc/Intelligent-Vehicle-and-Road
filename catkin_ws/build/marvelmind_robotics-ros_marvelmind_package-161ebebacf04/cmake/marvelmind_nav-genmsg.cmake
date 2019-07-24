# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "marvelmind_nav: 7 messages, 0 services")

set(MSG_I_FLAGS "-Imarvelmind_nav:/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(marvelmind_nav_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" ""
)

get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_custom_target(_marvelmind_nav_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "marvelmind_nav" "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_cpp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
)

### Generating Services

### Generating Module File
_generate_module_cpp(marvelmind_nav
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(marvelmind_nav_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(marvelmind_nav_generate_messages marvelmind_nav_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_cpp _marvelmind_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(marvelmind_nav_gencpp)
add_dependencies(marvelmind_nav_gencpp marvelmind_nav_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS marvelmind_nav_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_eus(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
)

### Generating Services

### Generating Module File
_generate_module_eus(marvelmind_nav
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(marvelmind_nav_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(marvelmind_nav_generate_messages marvelmind_nav_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_eus _marvelmind_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(marvelmind_nav_geneus)
add_dependencies(marvelmind_nav_geneus marvelmind_nav_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS marvelmind_nav_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_lisp(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
)

### Generating Services

### Generating Module File
_generate_module_lisp(marvelmind_nav
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(marvelmind_nav_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(marvelmind_nav_generate_messages marvelmind_nav_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_lisp _marvelmind_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(marvelmind_nav_genlisp)
add_dependencies(marvelmind_nav_genlisp marvelmind_nav_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS marvelmind_nav_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_nodejs(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
)

### Generating Services

### Generating Module File
_generate_module_nodejs(marvelmind_nav
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(marvelmind_nav_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(marvelmind_nav_generate_messages marvelmind_nav_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_nodejs _marvelmind_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(marvelmind_nav_gennodejs)
add_dependencies(marvelmind_nav_gennodejs marvelmind_nav_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS marvelmind_nav_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)
_generate_msg_py(marvelmind_nav
  "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
)

### Generating Services

### Generating Module File
_generate_module_py(marvelmind_nav
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(marvelmind_nav_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(marvelmind_nav_generate_messages marvelmind_nav_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_ang.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_raw.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_distance.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_pos.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/hedge_imu_fusion.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tongjirc/catkin_ws/src/marvelmind_robotics-ros_marvelmind_package-161ebebacf04/msg/beacon_pos_a.msg" NAME_WE)
add_dependencies(marvelmind_nav_generate_messages_py _marvelmind_nav_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(marvelmind_nav_genpy)
add_dependencies(marvelmind_nav_genpy marvelmind_nav_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS marvelmind_nav_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/marvelmind_nav
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(marvelmind_nav_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/marvelmind_nav
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(marvelmind_nav_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/marvelmind_nav
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(marvelmind_nav_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/marvelmind_nav
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(marvelmind_nav_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/marvelmind_nav
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(marvelmind_nav_generate_messages_py std_msgs_generate_messages_py)
endif()
