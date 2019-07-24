#include <ros.h>
#include <std_msgs/Float64.h>

ros::NodeHandle nh;
float i=0.0;
std_msgs::Float64 str_msg;

void messageCb( const std_msgs::Float64& toggle_msg){
    i=toggle_msg.data; 
}

ros::Subscriber<std_msgs::Float64> sub("toggle_led", &messageCb );
ros::Publisher chatter("chatter", &str_msg);
void setup()
{
  nh.initNode();
  nh.advertise(chatter);
  nh.subscribe(sub);
}

void loop()
{
  str_msg.data=i;
  chatter.publish( &str_msg );
  nh.spinOnce();
  delay(1);
}
