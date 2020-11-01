void lineDataPush() {
  //SerialVal = "20.0,20.0;30.0,30.0";
  //myPort.write("<");
  //myPort.write(SerialVal);
  //myPort.write(">");
  //pushFinished = true;
  while (serialPushCount <= LCPairCount) {
    SerialVal = pointPair[serialPushCount].SerialVal();
  }
  serialPushCount++;
  if (serialPushCount == LCPairCount) {
    pushFinished = true;
    serialPushCount = 0;
  }
}

void arcDataPush() {
  //SerialVal = "20.0,20.0;20.0;0.5;1.0";
  //myPort.write("<");
  //myPort.write(SerialVal);
  //myPort.write(">");
  //pushFinished = true;
  while (serialPushCount <= ACPairCount) {
    SerialVal = circleAxis[serialPushCount].arcSerial();
  }
  if (serialPushCount == ACPairCount) {
    pushFinished = true;
    serialPushCount = 0;
  }
}
