// Auto-generated. Do not edit!

// (in-package ptam_com.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let OctoMapPointArray = require('./OctoMapPointArray.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class OctoMapScan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapPoints = null;
      this.keyFramePose = null;
    }
    else {
      if (initObj.hasOwnProperty('mapPoints')) {
        this.mapPoints = initObj.mapPoints
      }
      else {
        this.mapPoints = new OctoMapPointArray();
      }
      if (initObj.hasOwnProperty('keyFramePose')) {
        this.keyFramePose = initObj.keyFramePose
      }
      else {
        this.keyFramePose = new geometry_msgs.msg.PoseWithCovarianceStamped();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OctoMapScan
    // Serialize message field [mapPoints]
    bufferOffset = OctoMapPointArray.serialize(obj.mapPoints, buffer, bufferOffset);
    // Serialize message field [keyFramePose]
    bufferOffset = geometry_msgs.msg.PoseWithCovarianceStamped.serialize(obj.keyFramePose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OctoMapScan
    let len;
    let data = new OctoMapScan(null);
    // Deserialize message field [mapPoints]
    data.mapPoints = OctoMapPointArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [keyFramePose]
    data.keyFramePose = geometry_msgs.msg.PoseWithCovarianceStamped.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += OctoMapPointArray.getMessageSize(object.mapPoints);
    length += geometry_msgs.msg.PoseWithCovarianceStamped.getMessageSize(object.keyFramePose);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ptam_com/OctoMapScan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6300a17df88639b05a1a89ffdf26ee86';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    OctoMapPointArray mapPoints
    geometry_msgs/PoseWithCovarianceStamped keyFramePose
    
    
    ================================================================================
    MSG: ptam_com/OctoMapPointArray
    OctoMapPointStamped[] mapPoints
    
    ================================================================================
    MSG: ptam_com/OctoMapPointStamped
    Header header
    uint8 INSERT = 0
    uint8 UPDATE = 1
    uint8 DELETE = 2
    
    uint8 action
    geometry_msgs/Vector3 position
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/PoseWithCovarianceStamped
    # This expresses an estimated pose with a reference coordinate frame and timestamp
    
    Header header
    PoseWithCovariance pose
    
    ================================================================================
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OctoMapScan(null);
    if (msg.mapPoints !== undefined) {
      resolved.mapPoints = OctoMapPointArray.Resolve(msg.mapPoints)
    }
    else {
      resolved.mapPoints = new OctoMapPointArray()
    }

    if (msg.keyFramePose !== undefined) {
      resolved.keyFramePose = geometry_msgs.msg.PoseWithCovarianceStamped.Resolve(msg.keyFramePose)
    }
    else {
      resolved.keyFramePose = new geometry_msgs.msg.PoseWithCovarianceStamped()
    }

    return resolved;
    }
};

module.exports = OctoMapScan;
