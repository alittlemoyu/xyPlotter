#include <AccelStepper.h>
//#include <Servo.h>
#include <MultiStepper.h>

// The X Stepper pins
#define STEPPER1_DIR_PIN 3
#define STEPPER1_STEP_PIN 2
// The Y stepper pins
#define STEPPER2_DIR_PIN 4
#define STEPPER2_STEP_PIN 5

//Servo myservo;

AccelStepper stepper1(AccelStepper::DRIVER, STEPPER1_STEP_PIN, STEPPER1_DIR_PIN);
AccelStepper stepper2(AccelStepper::DRIVER, STEPPER2_STEP_PIN, STEPPER2_DIR_PIN);

MultiStepper steppers;

boolean contactEstablished = false;
boolean EOLS = false;
boolean EOAS = false;
char answer;

long positions[2]; // Array of desired stepper positions
float siny;
int count = 0;
float tobeacosed;
float arccos;
float sindata;

void setup()
{
  Serial.begin(115200);
  stepper1.setMaxSpeed(100);
  stepper2.setMaxSpeed(100);
  //  myservo.attach(6);
  steppers.addStepper(stepper1);
  steppers.addStepper(stepper2);
  positions[0] = 0;
  positions[1] = 0;
}

void loop()
{
  //  if (count < 1600){
  //    count=count+1;
  //    positions[0]=count;
  //    Serial.println(positions[0]/1600.0);
  //    tobeacosed = (1600-count)/1600.0;
  //    arccos = acos(tobeacosed);
  //    sindata = sin(arccos)*1600;
  //    positions[1]= int(sindata);
  //    Serial.println(positions[1]);
  //    steppers.moveTo(positions);
  //    steppers.runSpeedToPosition();
  //  }
  delay(100);
  SerialFunc();
}
