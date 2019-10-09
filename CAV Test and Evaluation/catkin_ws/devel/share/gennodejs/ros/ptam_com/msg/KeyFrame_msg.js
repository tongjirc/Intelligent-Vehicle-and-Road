// Auto-generated. Do not edit!

// (in-package ptam_com.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class KeyFrame_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.KFids = null;
      this.KFs = null;
    }
    else {
      if (initObj.hasOwnProperty('KFids')) {
        this.KFids = initObj.KFids
      }
      else {
        this.KFids = [];
      }
      if (initObj.hasOwnProperty('KFs')) {
        this.KFs = initObj.KFs
      }
      else {
        this.KFs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KeyFrame_msg
    // Serialize message field [KFids]
    bufferOffset = _arraySerializer.uint32(obj.KFids, buffer, bufferOffset, null);
    // Serialize message field [KFs]
    // Serialize the length for message field [KFs]
    bufferOffset = _serializer.uint32(obj.KFs.length, buffer, bufferOffset);
    obj.KFs.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PoseWithCovarianceStamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KeyFrame_msg
    let len;
    let data = new KeyFrame_msg(null);
    // Deserialize message field [KFids]
    data.KFids = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [KFs]
    // Deserialize array length for message field [KFs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.KFs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.KFs[i] = geometry_msgs.msg.PoseWithCovarianceStamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.KFids.length;
    object.KFs.forEach((val) => {
      length += geometry_msgs.msg.PoseWithCovarianceStamped.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ptam_com/KeyFrame_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd865cbd185d5633ac1d50184eb2a3461';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32[]   KFids
    geometry_msgs/PoseWithCovarianceStamped[]   KFs
    
    ================================================================================
    MSG: geometry_msgs/PoseWithCovarianceStamped
    # This expresses an estimated pose with a reference coordinate frame and timestamp
    
    Header header
    PoseWithCovariance pose
    
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
    const resolved = new KeyFrame_msg(null);
    if (msg.KFids !== undefined) {
      resolved.KFids = msg.KFids;
    }
    else {
      resolved.KFids = []
    }

    if (msg.KFs !== undefined) {
      resolved.KFs = new Array(msg.KFs.length);
      for (let i = 0; i < resolved.KFs.length; ++i) {
        resolved.KFs[i] = geometry_msgs.msg.PoseWithCovarianceStamped.Resolve(msg.KFs[i]);
      }
    }
    else {
      resolved.KFs = []
    }

    return resolved;
    }
};

module.exports = KeyFrame_msg;
