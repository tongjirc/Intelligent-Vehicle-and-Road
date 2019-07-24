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

class rcinput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.EngineInput = null;
      this.SteerInput = null;
    }
    else {
      if (initObj.hasOwnProperty('EngineInput')) {
        this.EngineInput = initObj.EngineInput
      }
      else {
        this.EngineInput = 0;
      }
      if (initObj.hasOwnProperty('SteerInput')) {
        this.SteerInput = initObj.SteerInput
      }
      else {
        this.SteerInput = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rcinput
    // Serialize message field [EngineInput]
    bufferOffset = _serializer.int64(obj.EngineInput, buffer, bufferOffset);
    // Serialize message field [SteerInput]
    bufferOffset = _serializer.int64(obj.SteerInput, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rcinput
    let len;
    let data = new rcinput(null);
    // Deserialize message field [EngineInput]
    data.EngineInput = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [SteerInput]
    data.SteerInput = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tongjirc/rcinput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd8fc30fb11cc0f978b5dd3ea0ef06177';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 EngineInput
    int64 SteerInput
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rcinput(null);
    if (msg.EngineInput !== undefined) {
      resolved.EngineInput = msg.EngineInput;
    }
    else {
      resolved.EngineInput = 0
    }

    if (msg.SteerInput !== undefined) {
      resolved.SteerInput = msg.SteerInput;
    }
    else {
      resolved.SteerInput = 0
    }

    return resolved;
    }
};

module.exports = rcinput;
