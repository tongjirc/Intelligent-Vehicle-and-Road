// Auto-generated. Do not edit!

// (in-package YOLO.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class YOLO {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.classIds = null;
      this.confidences = null;
      this.boxes4 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('classIds')) {
        this.classIds = initObj.classIds
      }
      else {
        this.classIds = [];
      }
      if (initObj.hasOwnProperty('confidences')) {
        this.confidences = initObj.confidences
      }
      else {
        this.confidences = [];
      }
      if (initObj.hasOwnProperty('boxes4')) {
        this.boxes4 = initObj.boxes4
      }
      else {
        this.boxes4 = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type YOLO
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [classIds]
    bufferOffset = _arraySerializer.float64(obj.classIds, buffer, bufferOffset, null);
    // Serialize message field [confidences]
    bufferOffset = _arraySerializer.float64(obj.confidences, buffer, bufferOffset, null);
    // Serialize message field [boxes4]
    bufferOffset = _arraySerializer.uint8(obj.boxes4, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type YOLO
    let len;
    let data = new YOLO(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [classIds]
    data.classIds = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [confidences]
    data.confidences = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [boxes4]
    data.boxes4 = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.classIds.length;
    length += 8 * object.confidences.length;
    length += object.boxes4.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'YOLO/YOLO';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71d52b23e2f4848dfc8e90e1502e429b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    std_msgs/Header header
    
    #classIds,confidences,boxes(left, top, width, height)
    
    float64[] classIds
    float64[] confidences
    #boxes.flat()
    uint8[] boxes4
    
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
    const resolved = new YOLO(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.classIds !== undefined) {
      resolved.classIds = msg.classIds;
    }
    else {
      resolved.classIds = []
    }

    if (msg.confidences !== undefined) {
      resolved.confidences = msg.confidences;
    }
    else {
      resolved.confidences = []
    }

    if (msg.boxes4 !== undefined) {
      resolved.boxes4 = msg.boxes4;
    }
    else {
      resolved.boxes4 = []
    }

    return resolved;
    }
};

module.exports = YOLO;
