void SerialFunc() {
  if (contactEstablished == false)
  {
    establishContact();
  }
  else if ((EOLS == true) && (EOAS == false))
  {
    ArcSerial();
  }
  else if (EOLS == false)
  {
    LineSerial();
  }
  else if (EOLS && EOAS) Serial.end();
}
