#include <Main.ino>

void printLine(){
  myServo.write(30);
  positions[0] = floatX[0]*1600/4;
  positions[1] = floatY[0]*1600/4;
  steppers.moveTo(positions);
  steppers.runSpeedToPosition();
  myServo.write(0);
  positions[0] = floatX[1]*1600/4;
  positions[1] = floatY[1]*1600/4; 
  steppers.moveTo(positions);
  steppers.runSpeedToPosition();
  myServo.write(30);
}

void printArc(){
  // myServo.write(30);
  // positions[0] = (floatCircleX+floatCircleR*cos(theta*PI))*1600/4;
  // positions[1] = (floatCircleY+floatCircleR*sin(theta*PI))*1600/4;
  // steppers.moveTo(positions);
  // steppers.runSpeedToPosition();
  // myServo.write(0);
  // if (count < floatCircleR*((gamma-theta)/(PI/2))*1600/4){
  //   count=count+1;
  //   positions[0]=count;
  //   toBeAcosed = ((floatCircleR*1600/4-count)/(floatCircleR*1600/4);
  //   arccos = acos(toBeAcosed);
  //   sindata = sin(arccos)*floatCircleR;
  //   positions[1]= int(sindata);
  //   steppers.moveTo(positions);
  //   steppers.runSpeedToPosition();
  // }
  //WIP
}
