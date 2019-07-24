// Auto-generated. Do not edit!

// (in-package marvelmind_nav.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class hedge_pos_a {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.address = null;
      this.timestamp_ms = null;
      this.x_m = null;
      this.y_m = null;
      this.z_m = null;
      this.flags = null;
    }
    else {
      if (initObj.hasOwnProperty('address')) {
        this.address = initObj.address
      }
      else {
        this.address = 0;
      }
      if (initObj.hasOwnProperty('timestamp_ms')) {
        this.timestamp_ms = initObj.timestamp_ms
      }
      else {
        this.timestamp_ms = 0;
      }
      if (initObj.hasOwnProperty('x_m')) {
        this.x_m = initObj.x_m
      }
      else {
        this.x_m = 0.0;
      }
      if (initObj.hasOwnProperty('y_m')) {
        this.y_m = initObj.y_m
      }
      else {
        this.y_m = 0.0;
      }
      if (initObj.hasOwnProperty('z_m')) {
        this.z_m = initObj.z_m
      }
      else {
        this.z_m = 0.0;
      }
      if (initObj.hasOwnProperty('flags')) {
        this.flags = initObj.flags
      }
      else {
        this.flags = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hedge_pos_a
    // Serialize message field [address]
    bufferOffset = _serializer.uint8(obj.address, buffer, bufferOffset);
    // Serialize message field [timestamp_ms]
    bufferOffset = _serializer.int64(obj.timestamp_ms, buffer, bufferOffset);
    // Serialize message field [x_m]
    bufferOffset = _serializer.float64(obj.x_m, buffer, bufferOffset);
    // Serialize message field [y_m]
    bufferOffset = _serializer.float64(obj.y_m, buffer, bufferOffset);
    // Serialize message field [z_m]
    bufferOffset = _serializer.float64(obj.z_m, buffer, bufferOffset);
    // Serialize message field [flags]
    bufferOffset = _serializer.uint8(obj.flags, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hedge_pos_a
    let len;
    let data = new hedge_pos_a(null);
    // Deserialize message field [address]
    data.address = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [timestamp_ms]
    data.timestamp_ms = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [x_m]
    data.x_m = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_m]
    data.y_m = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z_m]
    data.z_m = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [flags]
    data.flags = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 34;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/hedge_pos_a';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '674512ab330b329e8180ed5adabac64b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 address
    int64 timestamp_ms
    float64 x_m
    float64 y_m
    float64 z_m
    uint8 flags
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new hedge_pos_a(null);
    if (msg.address !== undefined) {
      resolved.address = msg.address;
    }
    else {
      resolved.address = 0
    }

    if (msg.timestamp_ms !== undefined) {
      resolved.timestamp_ms = msg.timestamp_ms;
    }
    else {
      resolved.timestamp_ms = 0
    }

    if (msg.x_m !== undefined) {
      resolved.x_m = msg.x_m;
    }
    else {
      resolved.x_m = 0.0
    }

    if (msg.y_m !== undefined) {
      resolved.y_m = msg.y_m;
    }
    else {
      resolved.y_m = 0.0
    }

    if (msg.z_m !== undefined) {
      resolved.z_m = msg.z_m;
    }
    else {
      resolved.z_m = 0.0
    }

    if (msg.flags !== undefined) {
      resolved.flags = msg.flags;
    }
    else {
      resolved.flags = 0
    }

    return resolved;
    }
};

module.exports = hedge_pos_a;
