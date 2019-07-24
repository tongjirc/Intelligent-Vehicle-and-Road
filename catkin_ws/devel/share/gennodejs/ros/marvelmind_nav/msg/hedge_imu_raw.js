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

class hedge_imu_raw {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_ms = null;
      this.acc_x = null;
      this.acc_y = null;
      this.acc_z = null;
      this.gyro_x = null;
      this.gyro_y = null;
      this.gyro_z = null;
      this.compass_x = null;
      this.compass_y = null;
      this.compass_z = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp_ms')) {
        this.timestamp_ms = initObj.timestamp_ms
      }
      else {
        this.timestamp_ms = 0;
      }
      if (initObj.hasOwnProperty('acc_x')) {
        this.acc_x = initObj.acc_x
      }
      else {
        this.acc_x = 0;
      }
      if (initObj.hasOwnProperty('acc_y')) {
        this.acc_y = initObj.acc_y
      }
      else {
        this.acc_y = 0;
      }
      if (initObj.hasOwnProperty('acc_z')) {
        this.acc_z = initObj.acc_z
      }
      else {
        this.acc_z = 0;
      }
      if (initObj.hasOwnProperty('gyro_x')) {
        this.gyro_x = initObj.gyro_x
      }
      else {
        this.gyro_x = 0;
      }
      if (initObj.hasOwnProperty('gyro_y')) {
        this.gyro_y = initObj.gyro_y
      }
      else {
        this.gyro_y = 0;
      }
      if (initObj.hasOwnProperty('gyro_z')) {
        this.gyro_z = initObj.gyro_z
      }
      else {
        this.gyro_z = 0;
      }
      if (initObj.hasOwnProperty('compass_x')) {
        this.compass_x = initObj.compass_x
      }
      else {
        this.compass_x = 0;
      }
      if (initObj.hasOwnProperty('compass_y')) {
        this.compass_y = initObj.compass_y
      }
      else {
        this.compass_y = 0;
      }
      if (initObj.hasOwnProperty('compass_z')) {
        this.compass_z = initObj.compass_z
      }
      else {
        this.compass_z = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hedge_imu_raw
    // Serialize message field [timestamp_ms]
    bufferOffset = _serializer.int64(obj.timestamp_ms, buffer, bufferOffset);
    // Serialize message field [acc_x]
    bufferOffset = _serializer.int16(obj.acc_x, buffer, bufferOffset);
    // Serialize message field [acc_y]
    bufferOffset = _serializer.int16(obj.acc_y, buffer, bufferOffset);
    // Serialize message field [acc_z]
    bufferOffset = _serializer.int16(obj.acc_z, buffer, bufferOffset);
    // Serialize message field [gyro_x]
    bufferOffset = _serializer.int16(obj.gyro_x, buffer, bufferOffset);
    // Serialize message field [gyro_y]
    bufferOffset = _serializer.int16(obj.gyro_y, buffer, bufferOffset);
    // Serialize message field [gyro_z]
    bufferOffset = _serializer.int16(obj.gyro_z, buffer, bufferOffset);
    // Serialize message field [compass_x]
    bufferOffset = _serializer.int16(obj.compass_x, buffer, bufferOffset);
    // Serialize message field [compass_y]
    bufferOffset = _serializer.int16(obj.compass_y, buffer, bufferOffset);
    // Serialize message field [compass_z]
    bufferOffset = _serializer.int16(obj.compass_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hedge_imu_raw
    let len;
    let data = new hedge_imu_raw(null);
    // Deserialize message field [timestamp_ms]
    data.timestamp_ms = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [acc_x]
    data.acc_x = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acc_y]
    data.acc_y = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acc_z]
    data.acc_z = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gyro_x]
    data.gyro_x = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gyro_y]
    data.gyro_y = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gyro_z]
    data.gyro_z = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [compass_x]
    data.compass_x = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [compass_y]
    data.compass_y = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [compass_z]
    data.compass_z = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/hedge_imu_raw';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '809304d028f09940bd722db544d5d2e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 timestamp_ms
    int16 acc_x
    int16 acc_y
    int16 acc_z
    int16 gyro_x
    int16 gyro_y
    int16 gyro_z
    int16 compass_x
    int16 compass_y
    int16 compass_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new hedge_imu_raw(null);
    if (msg.timestamp_ms !== undefined) {
      resolved.timestamp_ms = msg.timestamp_ms;
    }
    else {
      resolved.timestamp_ms = 0
    }

    if (msg.acc_x !== undefined) {
      resolved.acc_x = msg.acc_x;
    }
    else {
      resolved.acc_x = 0
    }

    if (msg.acc_y !== undefined) {
      resolved.acc_y = msg.acc_y;
    }
    else {
      resolved.acc_y = 0
    }

    if (msg.acc_z !== undefined) {
      resolved.acc_z = msg.acc_z;
    }
    else {
      resolved.acc_z = 0
    }

    if (msg.gyro_x !== undefined) {
      resolved.gyro_x = msg.gyro_x;
    }
    else {
      resolved.gyro_x = 0
    }

    if (msg.gyro_y !== undefined) {
      resolved.gyro_y = msg.gyro_y;
    }
    else {
      resolved.gyro_y = 0
    }

    if (msg.gyro_z !== undefined) {
      resolved.gyro_z = msg.gyro_z;
    }
    else {
      resolved.gyro_z = 0
    }

    if (msg.compass_x !== undefined) {
      resolved.compass_x = msg.compass_x;
    }
    else {
      resolved.compass_x = 0
    }

    if (msg.compass_y !== undefined) {
      resolved.compass_y = msg.compass_y;
    }
    else {
      resolved.compass_y = 0
    }

    if (msg.compass_z !== undefined) {
      resolved.compass_z = msg.compass_z;
    }
    else {
      resolved.compass_z = 0
    }

    return resolved;
    }
};

module.exports = hedge_imu_raw;
