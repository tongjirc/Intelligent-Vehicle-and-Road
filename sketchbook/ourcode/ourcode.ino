// include libraries

#include <ros.h>
#include <std_msgs/Float64.h>
#include <Servo.h>
//#include <EnableInterrupt.h>
ros::NodeHandle  nh;
std_msgs::Float64 str_msg;
ros::Publisher chatter("chatter", &str_msg);

float out;
/**************************************************************************
 * CAR CLASS DEFINITION (would like to refactor into car.cpp and car.h but can't figure out arduino build process so far)
 **************************************************************************/
class Car {
public:
  void initRCInput();
  void initActuators();
  void armActuators();
  void outputRCsignal();//shuchudianping
  // Used for copying variables shared with interrupts to avoid read/write
  // conflicts later
  void readAndCopyInputs();
  // Getters
  uint16_t getRCThrottle();
  uint16_t getRCSteering();

  // Interrupt service routines

  void calcThrottle();
  void calcSteering();
  void killMotor();
private:
  // Pin assignments
  const int THROTTLE_PIN= 7; //input
  const int STEERING_PIN = 8;//input
  const int MOTOR_PIN = 10;
  const int SERVO_PIN = 9;

  // Car properties
  // unclear what this is for
  const int noAction = 0;

  // Motor limits
  // TODO  fix limits?
  const int MOTOR_MAX = 2000;
  const int MOTOR_MIN = 800;
  const int MOTOR_NEUTRAL = 1500;
  const int THETA_CENTER = 1500;
  const int THETA_MAX = 1900;
  const int THETA_MIN = 1100;

  // Interfaces to motor and steering actuators
  Servo motor;
  Servo steering;

  // Utility variables to handle RC and encoder inputs
  volatile uint8_t updateFlagsShared;
  uint8_t updateFlags;
  const int THROTTLE_FLAG = 1;
  const int STEERING_FLAG = 2;

  // RC joystick 
  uint32_t throttleStart;
  uint32_t steeringStart;
  volatile uint16_t throttleInShared;
  volatile uint16_t steeringInShared;
  uint16_t throttleIn = 1500;
  uint16_t steeringIn = 1500;

  // motor / servo neutral state (milliseconds)
  float throttle_neutral_ms = 1500.0;
  float servo_neutral_ms = 1500.0;

  // Utility functions

};

// Boolean keeping track of whether the Arduino has received a signal from the ECU recently

float pi                = 3.141593;
float R                 = 0.051;        // radius of the wheel

// Initialize an instance of the Car class as car
Car car;

// Callback Functions
// These are really sad solutions to the fact that using class member functions
// as callbacks is complicated in C++ and I haven't figured it out. If you can
// figure it out, please atone for my sins.

void calcSteeringCallback() {
  car.calcSteering();
}
void calcThrottleCallback() {
  car.calcThrottle();
}

// Variables for time step
volatile unsigned long dt;
volatile unsigned long t0;

// Global message variables
// Encoder, RC Inputs, Electronic Control Unit, Ultrasound

/**************************************************************************
 * ARDUINO INITIALIZATION
 **************************************************************************/
void setup()
{
 // Set up encoders, rc input, and actuators
  car.initRCInput();//
  car.initActuators();//motor steering attach
  
  nh.initNode();
  nh.advertise(chatter);
  
  car.armActuators();//chushihua zhengchangweizhi
  
  t0 = millis();
}


/**************************************************************************
 * ARDUINO MAIN lOOP
 **************************************************************************/
void loop() 
{
  car.readAndCopyInputs();
  car.outputRCsignal();
  // rc_inputs.motor = car.getRCThrottle();
  // rc_inputs.servo = car.getRCSteering();
  out=(float)car.getRCThrottle();
  str_msg.data = out;
  chatter.publish( &str_msg );
  //t0 = millis();
  nh.spinOnce();
}

/**************************************************************************
 * CAR CLASS IMPLEMENTATION
 **************************************************************************/
void Car::initRCInput() {
  pinMode(THROTTLE_PIN, INPUT_PULLUP);
  pinMode(STEERING_PIN, INPUT_PULLUP);
  attachInterrupt(2, calcThrottleCallback, CHANGE);
  attachInterrupt(3, calcSteeringCallback, CHANGE);
}
void Car::initActuators() {
  motor.attach(MOTOR_PIN);
  steering.attach(SERVO_PIN);
}

void Car::armActuators() {
  motor.writeMicroseconds( (uint16_t) throttle_neutral_ms );
  steering.writeMicroseconds( (uint16_t) servo_neutral_ms );
  delay(1000);
}
void Car::outputRCsignal() {
  motor.writeMicroseconds( (uint16_t)car.getRCThrottle());
  steering.writeMicroseconds( (uint16_t)car.getRCSteering());
}

void Car::calcThrottle() {
  if(digitalRead(THROTTLE_PIN) == HIGH) {
    // rising edge of the signal pulse, start timing
    throttleStart = micros();
  } 
  else {
    // falling edge, calculate duration of throttle pulse
    throttleInShared = (uint16_t)(micros() - throttleStart);
    // set the throttle flag to indicate that a new signal has been received
    updateFlagsShared |= THROTTLE_FLAG;
  }
}

void Car::calcSteering() {
  if(digitalRead(STEERING_PIN) == HIGH) {
    steeringStart = micros();
  } 
  else {
    steeringInShared = (uint16_t)(micros() - steeringStart);
    updateFlagsShared |= STEERING_FLAG;
  }
}

void Car::killMotor(){
  motor.writeMicroseconds( (uint16_t) throttle_neutral_ms );
  steering.writeMicroseconds( (uint16_t) servo_neutral_ms );
}

void Car::readAndCopyInputs() {
  // check shared update flags to see if any channels have a new signal
  if (updateFlagsShared) {
    // Turn off interrupts, make local copies of variables set by interrupts,
    // then turn interrupts back on. Without doing this, an interrupt could
    // update a shared multibyte variable while the loop is in the middle of
    // reading it
    noInterrupts();
    // make local copies
    updateFlags = updateFlagsShared;
    if(updateFlags & THROTTLE_FLAG) {
      throttleIn = throttleInShared;
    }
    if(updateFlags & STEERING_FLAG) {
      steeringIn = steeringInShared;
    }
    // clear shared update flags and turn interrupts back on
    updateFlagsShared = 0;
    interrupts();
  }
}

uint16_t Car::getRCThrottle() {
  return throttleIn;
}
uint16_t Car::getRCSteering() {
  return steeringIn;
}

