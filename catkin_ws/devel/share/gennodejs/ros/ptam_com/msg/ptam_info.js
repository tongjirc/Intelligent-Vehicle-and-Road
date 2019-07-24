// Auto-generated. Do not edit!

// (in-package ptam_com.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ptam_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.fps = null;
      this.keyframes = null;
      this.trackingQuality = null;
      this.mapQuality = null;
      this.mapViewerMessage = null;
      this.trackerMessage = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('fps')) {
        this.fps = initObj.fps
      }
      else {
        this.fps = 0.0;
      }
      if (initObj.hasOwnProperty('keyframes')) {
        this.keyframes = initObj.keyframes
      }
      else {
        this.keyframes = 0;
      }
      if (initObj.hasOwnProperty('trackingQuality')) {
        this.trackingQuality = initObj.trackingQuality
      }
      else {
        this.trackingQuality = 0;
      }
      if (initObj.hasOwnProperty('mapQuality')) {
        this.mapQuality = initObj.mapQuality
      }
      else {
        this.mapQuality = false;
      }
      if (initObj.hasOwnProperty('mapViewerMessage')) {
        this.mapViewerMessage = initObj.mapViewerMessage
      }
      else {
        this.mapViewerMessage = '';
      }
      if (initObj.hasOwnProperty('trackerMessage')) {
        this.trackerMessage = initObj.trackerMessage
      }
      else {
        this.trackerMessage = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ptam_info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [fps]
    bufferOffset = _serializer.float32(obj.fps, buffer, bufferOffset);
    // Serialize message field [keyframes]
    bufferOffset = _serializer.int32(obj.keyframes, buffer, bufferOffset);
    // Serialize message field [trackingQuality]
    bufferOffset = _serializer.int32(obj.trackingQuality, buffer, bufferOffset);
    // Serialize message field [mapQuality]
    bufferOffset = _serializer.bool(obj.mapQuality, buffer, bufferOffset);
    // Serialize message field [mapViewerMessage]
    bufferOffset = _serializer.string(obj.mapViewerMessage, buffer, bufferOffset);
    // Serialize message field [trackerMessage]
    bufferOffset = _serializer.string(obj.trackerMessage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ptam_info
    let len;
    let data = new ptam_info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [fps]
    data.fps = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [keyframes]
    data.keyframes = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [trackingQuality]
    data.trackingQuality = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mapQuality]
    data.mapQuality = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mapViewerMessage]
    data.mapViewerMessage = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [trackerMessage]
    data.trackerMessage = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.mapViewerMessage.length;
    length += object.trackerMessage.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ptam_com/ptam_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '798e178ae56263a37e464710cafb5ffc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header      header
    float32     fps
    int32       keyframes
    int32       trackingQuality
    bool        mapQuality
    string      mapViewerMessage
    string      trackerMessage
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
    const resolved = new ptam_info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.fps !== undefined) {
      resolved.fps = msg.fps;
    }
    else {
      resolved.fps = 0.0
    }

    if (msg.keyframes !== undefined) {
      resolved.keyframes = msg.keyframes;
    }
    else {
      resolved.keyframes = 0
    }

    if (msg.trackingQuality !== undefined) {
      resolved.trackingQuality = msg.trackingQuality;
    }
    else {
      resolved.trackingQuality = 0
    }

    if (msg.mapQuality !== undefined) {
      resolved.mapQuality = msg.mapQuality;
    }
    else {
      resolved.mapQuality = false
    }

    if (msg.mapViewerMessage !== undefined) {
      resolved.mapViewerMessage = msg.mapViewerMessage;
    }
    else {
      resolved.mapViewerMessage = ''
    }

    if (msg.trackerMessage !== undefined) {
      resolved.trackerMessage = msg.trackerMessage;
    }
    else {
      resolved.trackerMessage = ''
    }

    return resolved;
    }
};

module.exports = ptam_info;
