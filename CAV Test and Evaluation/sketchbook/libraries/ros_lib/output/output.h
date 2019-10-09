#ifndef _ROS_output_output_h
#define _ROS_output_output_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace output
{

  class output : public ros::Msg
  {
    public:
      typedef int8_t _state_type;
      _state_type state;
      typedef float _motor_type;
      _motor_type motor;
      typedef float _steer_type;
      _steer_type steer;

    output():
      state(0),
      motor(0),
      steer(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_state;
      u_state.real = this->state;
      *(outbuffer + offset + 0) = (u_state.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->state);
      offset += serializeAvrFloat64(outbuffer + offset, this->motor);
      offset += serializeAvrFloat64(outbuffer + offset, this->steer);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_state;
      u_state.base = 0;
      u_state.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->state = u_state.real;
      offset += sizeof(this->state);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->motor));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->steer));
     return offset;
    }

    const char * getType(){ return "output/output"; };
    const char * getMD5(){ return "e65caaa63c403a0af0f3267ca901c242"; };

  };

}
#endif
