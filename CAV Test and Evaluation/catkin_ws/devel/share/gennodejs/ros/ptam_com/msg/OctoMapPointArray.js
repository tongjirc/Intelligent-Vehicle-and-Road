// Auto-generated. Do not edit!

// (in-package ptam_com.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let OctoMapPointStamped = require('./OctoMapPointStamped.js');

//-----------------------------------------------------------

class OctoMapPointArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapPoints = null;
    }
    else {
      if (initObj.hasOwnProperty('mapPoints')) {
        this.mapPoints = initObj.mapPoints
      }
      else {
        this.mapPoints = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OctoMapPointArray
    // Serialize message field [mapPoints]
    // Serialize the length for message field [mapPoints]
    bufferOffset = _serializer.uint32(obj.mapPoints.length, buffer, bufferOffset);
    obj.mapPoints.forEach((val) => {
      bufferOffset = OctoMapPointStamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OctoMapPointArray
    let len;
    let data = new OctoMapPointArray(null);
    // Deserialize message field [mapPoints]
    // Deserialize array length for message field [mapPoints]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.mapPoints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.mapPoints[i] = OctoMapPointStamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.mapPoints.forEach((val) => {
      length += OctoMapPointStamped.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ptam_com/OctoMapPointArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f65418a8cd445702b4ff05d157c76c47';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OctoMapPointArray(null);
    if (msg.mapPoints !== undefined) {
      resolved.mapPoints = new Array(msg.mapPoints.length);
      for (let i = 0; i < resolved.mapPoints.length; ++i) {
        resolved.mapPoints[i] = OctoMapPointStamped.Resolve(msg.mapPoints[i]);
      }
    }
    else {
      resolved.mapPoints = []
    }

    return resolved;
    }
};

module.exports = OctoMapPointArray;
