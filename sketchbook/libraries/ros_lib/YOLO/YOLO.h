#ifndef _ROS_YOLO_YOLO_h
#define _ROS_YOLO_YOLO_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "std_msgs/Header.h"

namespace YOLO
{

  class YOLO : public ros::Msg
  {
    public:
      typedef std_msgs::Header _header_type;
      _header_type header;
      uint32_t classIds_length;
      typedef float _classIds_type;
      _classIds_type st_classIds;
      _classIds_type * classIds;
      uint32_t confidences_length;
      typedef float _confidences_type;
      _confidences_type st_confidences;
      _confidences_type * confidences;
      uint32_t boxes4_length;
      typedef uint8_t _boxes4_type;
      _boxes4_type st_boxes4;
      _boxes4_type * boxes4;

    YOLO():
      header(),
      classIds_length(0), classIds(NULL),
      confidences_length(0), confidences(NULL),
      boxes4_length(0), boxes4(NULL)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      *(outbuffer + offset + 0) = (this->classIds_length >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->classIds_length >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->classIds_length >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->classIds_length >> (8 * 3)) & 0xFF;
      offset += sizeof(this->classIds_length);
      for( uint32_t i = 0; i < classIds_length; i++){
      offset += serializeAvrFloat64(outbuffer + offset, this->classIds[i]);
      }
      *(outbuffer + offset + 0) = (this->confidences_length >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->confidences_length >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->confidences_length >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->confidences_length >> (8 * 3)) & 0xFF;
      offset += sizeof(this->confidences_length);
      for( uint32_t i = 0; i < confidences_length; i++){
      offset += serializeAvrFloat64(outbuffer + offset, this->confidences[i]);
      }
      *(outbuffer + offset + 0) = (this->boxes4_length >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->boxes4_length >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->boxes4_length >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->boxes4_length >> (8 * 3)) & 0xFF;
      offset += sizeof(this->boxes4_length);
      for( uint32_t i = 0; i < boxes4_length; i++){
      *(outbuffer + offset + 0) = (this->boxes4[i] >> (8 * 0)) & 0xFF;
      offset += sizeof(this->boxes4[i]);
      }
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      uint32_t classIds_lengthT = ((uint32_t) (*(inbuffer + offset))); 
      classIds_lengthT |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1); 
      classIds_lengthT |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2); 
      classIds_lengthT |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3); 
      offset += sizeof(this->classIds_length);
      if(classIds_lengthT > classIds_length)
        this->classIds = (float*)realloc(this->classIds, classIds_lengthT * sizeof(float));
      classIds_length = classIds_lengthT;
      for( uint32_t i = 0; i < classIds_length; i++){
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->st_classIds));
        memcpy( &(this->classIds[i]), &(this->st_classIds), sizeof(float));
      }
      uint32_t confidences_lengthT = ((uint32_t) (*(inbuffer + offset))); 
      confidences_lengthT |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1); 
      confidences_lengthT |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2); 
      confidences_lengthT |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3); 
      offset += sizeof(this->confidences_length);
      if(confidences_lengthT > confidences_length)
        this->confidences = (float*)realloc(this->confidences, confidences_lengthT * sizeof(float));
      confidences_length = confidences_lengthT;
      for( uint32_t i = 0; i < confidences_length; i++){
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->st_confidences));
        memcpy( &(this->confidences[i]), &(this->st_confidences), sizeof(float));
      }
      uint32_t boxes4_lengthT = ((uint32_t) (*(inbuffer + offset))); 
      boxes4_lengthT |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1); 
      boxes4_lengthT |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2); 
      boxes4_lengthT |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3); 
      offset += sizeof(this->boxes4_length);
      if(boxes4_lengthT > boxes4_length)
        this->boxes4 = (uint8_t*)realloc(this->boxes4, boxes4_lengthT * sizeof(uint8_t));
      boxes4_length = boxes4_lengthT;
      for( uint32_t i = 0; i < boxes4_length; i++){
      this->st_boxes4 =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->st_boxes4);
        memcpy( &(this->boxes4[i]), &(this->st_boxes4), sizeof(uint8_t));
      }
     return offset;
    }

    const char * getType(){ return "YOLO/YOLO"; };
    const char * getMD5(){ return "71d52b23e2f4848dfc8e90e1502e429b"; };

  };

}
#endif
