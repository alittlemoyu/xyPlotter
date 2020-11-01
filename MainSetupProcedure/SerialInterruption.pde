void serialInterruption(Serial myPort) {
  inByte = myPort.readChar();
  if (contactEstablished == false)
  {
    establishContact();
  } 
  switch (inByte) {
  case 'L':
    println("case 'L':");
    if (EOLS == false) {
      myPort.write('O');
      println("LineSerial();");
      LineSerial();
    } else {
      myPort.write('E');
      println("myPort.write('E');");
    }
    break;
  case 'A':
    println("case 'A':");
    if (EOAS == false) {
      myPort.write('O');
      println("ArcSerial();");
      ArcSerial();
    } else {
      myPort.write('E');
      println("myPort.write('E');");
    }
    break;
  }
}
