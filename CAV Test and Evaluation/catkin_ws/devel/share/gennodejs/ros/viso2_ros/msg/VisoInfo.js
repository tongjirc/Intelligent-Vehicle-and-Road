// Auto-generated. Do not edit!

// (in-package viso2_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class VisoInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.got_lost = null;
      this.change_reference_frame = null;
      this.motion_estimate_valid = null;
      this.num_matches = null;
      this.num_inliers = null;
      this.runtime = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('got_lost')) {
        this.got_lost = initObj.got_lost
      }
      else {
        this.got_lost = false;
      }
      if (initObj.hasOwnProperty('change_reference_frame')) {
        this.change_reference_frame = initObj.change_reference_frame
      }
      else {
        this.change_reference_frame = false;
      }
      if (initObj.hasOwnProperty('motion_estimate_valid')) {
        this.motion_estimate_valid = initObj.motion_estimate_valid
      }
      else {
        this.motion_estimate_valid = false;
      }
      if (initObj.hasOwnProperty('num_matches')) {
        this.num_matches = initObj.num_matches
      }
      else {
        this.num_matches = 0;
      }
      if (initObj.hasOwnProperty('num_inliers')) {
        this.num_inliers = initObj.num_inliers
      }
      else {
        this.num_inliers = 0;
      }
      if (initObj.hasOwnProperty('runtime')) {
        this.runtime = initObj.runtime
      }
      else {
        this.runtime = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VisoInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [got_lost]
    bufferOffset = _serializer.bool(obj.got_lost, buffer, bufferOffset);
    // Serialize message field [change_reference_frame]
    bufferOffset = _serializer.bool(obj.change_reference_frame, buffer, bufferOffset);
    // Serialize message field [motion_estimate_valid]
    bufferOffset = _serializer.bool(obj.motion_estimate_valid, buffer, bufferOffset);
    // Serialize message field [num_matches]
    bufferOffset = _serializer.int32(obj.num_matches, buffer, bufferOffset);
    // Serialize message field [num_inliers]
    bufferOffset = _serializer.int32(obj.num_inliers, buffer, bufferOffset);
    // Serialize message field [runtime]
    bufferOffset = _serializer.float64(obj.runtime, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VisoInfo
    let len;
    let data = new VisoInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [got_lost]
    data.got_lost = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [change_reference_frame]
    data.change_reference_frame = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [motion_estimate_valid]
    data.motion_estimate_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [num_matches]
    data.num_matches = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [num_inliers]
    data.num_inliers = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [runtime]
    data.runtime = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'viso2_ros/VisoInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '765500d8b83bf74f7715c6e2e8e89092';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Internal information on the
    # viso2 algorithm parameters
    # and results
    
    Header header
    
    # True if the previous iteration of viso2
    # was not able to complete the matching process
    # therefore the visual odometer is re-started.
    bool got_lost
    
    # True if in the next run the reference 
    # frame will be changed. This is the case
    # when the number of inliers drops below
    # a threshold or the previous motion estimate
    # failed in last motion estimation.
    bool change_reference_frame
    
    # info from motion estimator
    bool motion_estimate_valid
    int32 num_matches
    int32 num_inliers
    
    # runtime of last iteration in seconds
    float64 runtime
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VisoInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.got_lost !== undefined) {
      resolved.got_lost = msg.got_lost;
    }
    else {
      resolved.got_lost = false
    }

    if (msg.change_reference_frame !== undefined) {
      resolved.change_reference_frame = msg.change_reference_frame;
    }
    else {
      resolved.change_reference_frame = false
    }

    if (msg.motion_estimate_valid !== undefined) {
      resolved.motion_estimate_valid = msg.motion_estimate_valid;
    }
    else {
      resolved.motion_estimate_valid = false
    }

    if (msg.num_matches !== undefined) {
      resolved.num_matches = msg.num_matches;
    }
    else {
      resolved.num_matches = 0
    }

    if (msg.num_inliers !== undefined) {
      resolved.num_inliers = msg.num_inliers;
    }
    else {
      resolved.num_inliers = 0
    }

    if (msg.runtime !== undefined) {
      resolved.runtime = msg.runtime;
    }
    else {
      resolved.runtime = 0.0
    }

    return resolved;
    }
};

module.exports = VisoInfo;
