void LineSerial() {
  lineDataPush();
  println("lineDataPush();");
  if (pushFinished == true) {
    EOLS = true;
    println("EOLS = true;");
    pushFinished = false;
  }
}

void ArcSerial() {
  arcDataPush();
  println("arcDataPush();");
  if (pushFinished == true) {
    EOAS = true;
    println("EOAS = true;"); 
    pushFinished = false;
  }
}

void establishContact() {
  if (inByte == '1') {
    contactEstablished = true;
    println("contactEstablished = true");
  }
}
