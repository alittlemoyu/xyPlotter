#include <AccelStepper.h>
//#include <Servo.h>
#include <MultiStepper.h>

// The X Stepper pins
#define STEPPER1_DIR_PIN 3
#define STEPPER1_STEP_PIN 2
// The Y stepper pins
#define STEPPER2_DIR_PIN 4
#define STEPPER2_STEP_PIN 5

Servo myServo;

AccelStepper stepper1(AccelStepper::DRIVER, STEPPER1_STEP_PIN, STEPPER1_DIR_PIN);
AccelStepper stepper2(AccelStepper::DRIVER, STEPPER2_STEP_PIN, STEPPER2_DIR_PIN);

MultiStepper steppers;

boolean contactEstablished = false;
boolean EOLS = false;
boolean EOAS = false;
char answer;

long positions[2]; // Array of desired stepper positions
int count = 0;

void setup()
{
  Serial.begin(115200);
  stepper1.setMaxSpeed(100);
  stepper2.setMaxSpeed(100);
  myServo.attach(6);
  steppers.addStepper(stepper1);
  steppers.addStepper(stepper2);
  positions[0] = 0;
  positions[1] = 0;
}

void loop()
{

  delay(100);
  SerialFunc();
}
