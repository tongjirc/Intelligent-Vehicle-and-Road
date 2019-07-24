// Auto-generated. Do not edit!

// (in-package tongjirc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class tongjircFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.percent_completes = null;
    }
    else {
      if (initObj.hasOwnProperty('percent_completes')) {
        this.percent_completes = initObj.percent_completes
      }
      else {
        this.percent_completes = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tongjircFeedback
    // Serialize message field [percent_completes]
    bufferOffset = _serializer.float32(obj.percent_completes, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tongjircFeedback
    let len;
    let data = new tongjircFeedback(null);
    // Deserialize message field [percent_completes]
    data.percent_completes = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tongjirc/tongjircFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b348798990ac2df8ee8319c093eab504';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Define a feedback message 
    float32 percent_completes
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tongjircFeedback(null);
    if (msg.percent_completes !== undefined) {
      resolved.percent_completes = msg.percent_completes;
    }
    else {
      resolved.percent_completes = 0.0
    }

    return resolved;
    }
};

module.exports = tongjircFeedback;
