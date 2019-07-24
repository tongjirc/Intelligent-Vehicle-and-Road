// Generated by gencpp from file ptam_com/OctoMapPointStamped.msg
// DO NOT EDIT!


#ifndef PTAM_COM_MESSAGE_OCTOMAPPOINTSTAMPED_H
#define PTAM_COM_MESSAGE_OCTOMAPPOINTSTAMPED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Vector3.h>

namespace ptam_com
{
template <class ContainerAllocator>
struct OctoMapPointStamped_
{
  typedef OctoMapPointStamped_<ContainerAllocator> Type;

  OctoMapPointStamped_()
    : header()
    , action(0)
    , position()  {
    }
  OctoMapPointStamped_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , action(0)
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _action_type;
  _action_type action;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _position_type;
  _position_type position;



  enum {
    INSERT = 0u,
    UPDATE = 1u,
    DELETE = 2u,
  };


  typedef boost::shared_ptr< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> const> ConstPtr;

}; // struct OctoMapPointStamped_

typedef ::ptam_com::OctoMapPointStamped_<std::allocator<void> > OctoMapPointStamped;

typedef boost::shared_ptr< ::ptam_com::OctoMapPointStamped > OctoMapPointStampedPtr;
typedef boost::shared_ptr< ::ptam_com::OctoMapPointStamped const> OctoMapPointStampedConstPtr;

// constants requiring out of line definition

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ptam_com::OctoMapPointStamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ptam_com

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'ptam_com': ['/home/tongjirc/catkin_ws/src/ethzasl_ptam/ptam_com/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "261f3d921672cadc0daf48420ac709b5";
  }

  static const char* value(const ::ptam_com::OctoMapPointStamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x261f3d921672cadcULL;
  static const uint64_t static_value2 = 0x0daf48420ac709b5ULL;
};

template<class ContainerAllocator>
struct DataType< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ptam_com/OctoMapPointStamped";
  }

  static const char* value(const ::ptam_com::OctoMapPointStamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
uint8 INSERT = 0\n\
uint8 UPDATE = 1\n\
uint8 DELETE = 2\n\
\n\
uint8 action\n\
geometry_msgs/Vector3 position\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::ptam_com::OctoMapPointStamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.action);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OctoMapPointStamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ptam_com::OctoMapPointStamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ptam_com::OctoMapPointStamped_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "action: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.action);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PTAM_COM_MESSAGE_OCTOMAPPOINTSTAMPED_H
