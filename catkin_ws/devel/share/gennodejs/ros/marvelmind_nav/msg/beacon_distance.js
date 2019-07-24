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

class beacon_distance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.address_hedge = null;
      this.address_beacon = null;
      this.distance_m = null;
    }
    else {
      if (initObj.hasOwnProperty('address_hedge')) {
        this.address_hedge = initObj.address_hedge
      }
      else {
        this.address_hedge = 0;
      }
      if (initObj.hasOwnProperty('address_beacon')) {
        this.address_beacon = initObj.address_beacon
      }
      else {
        this.address_beacon = 0;
      }
      if (initObj.hasOwnProperty('distance_m')) {
        this.distance_m = initObj.distance_m
      }
      else {
        this.distance_m = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type beacon_distance
    // Serialize message field [address_hedge]
    bufferOffset = _serializer.uint8(obj.address_hedge, buffer, bufferOffset);
    // Serialize message field [address_beacon]
    bufferOffset = _serializer.uint8(obj.address_beacon, buffer, bufferOffset);
    // Serialize message field [distance_m]
    bufferOffset = _serializer.float64(obj.distance_m, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type beacon_distance
    let len;
    let data = new beacon_distance(null);
    // Deserialize message field [address_hedge]
    data.address_hedge = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [address_beacon]
    data.address_beacon = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [distance_m]
    data.distance_m = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/beacon_distance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0961792211a42c14a3b38a49e24931f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 address_hedge
    uint8 address_beacon
    float64 distance_m
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new beacon_distance(null);
    if (msg.address_hedge !== undefined) {
      resolved.address_hedge = msg.address_hedge;
    }
    else {
      resolved.address_hedge = 0
    }

    if (msg.address_beacon !== undefined) {
      resolved.address_beacon = msg.address_beacon;
    }
    else {
      resolved.address_beacon = 0
    }

    if (msg.distance_m !== undefined) {
      resolved.distance_m = msg.distance_m;
    }
    else {
      resolved.distance_m = 0.0
    }

    return resolved;
    }
};

module.exports = beacon_distance;
