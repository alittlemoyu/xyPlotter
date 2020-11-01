char inByte = '0';
boolean transReady = false;
const byte numChars = 64;
char receivedChars[numChars];
char tempChars[numChars];
float floatX[2];
float floatY[2];
float floatCircleX;
float floatCircleY;
float floatCircleR;
float floatCircleTheta;
float floatCircleGamma;
static byte ndx = 0;
boolean newData = false;

void LineSerial() {
  lineDataPull();
  if (EOLS == false) {
    recvWithStartEndMarkers();
    if (newData == true) {
      strcpy(tempChars, receivedChars);
      parseData('L');
      printLine();//InProgress
      newData = false;
    }
  }
}

void ArcSerial() {
  arcDataPull();
  if (EOAS == false) {
    recvWithStartEndMarkers();
    if (newData == true) {
      strcpy(tempChars, receivedChars);
      parseData('A');
      printArc();//InProgress
      newData = false;
    }
  }
}

void establishContact() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    if (inByte == '1') {
      Serial.write('1');
      contactEstablished = true;
    }
  }
}

void recvWithStartEndMarkers() {
  //  Serial.println("Wait for Receiving");
  static boolean recvInProgress = false;
  ndx = 0;
  char startMarker = '<';
  char endMarker = '>';
  char rc;

  while (Serial.available() > 0 && newData == false) {
    //    Serial.println("Receiving");
    rc = Serial.read();

    if (recvInProgress == true) {
      if (rc != endMarker) {
        receivedChars[ndx] = rc;
        ndx++;
        if (ndx >= numChars) {
          ndx = numChars - 1;
        }
      }
      else {
        receivedChars[ndx] = '\0';
        recvInProgress = false;
        ndx = 0;
        newData = true;
      }
    }

    else if (rc == startMarker) {
      recvInProgress = true;
    }
  }
}

void parseData(char mark) {

  ndx = 0;
  char * strtokIndx; // this is used by strtok() as an index
  if (mark == 'L') {
    strtokIndx = strtok(tempChars, ",");
    floatX[ndx] = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatY[ndx] = atof(strtokIndx);
    ndx++;

    strtokIndx = strtok(NULL, ",");
    floatX[ndx] = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatY[ndx] = atof(strtokIndx);
  }

  if (mark == 'A') {
    strtokIndx = strtok(tempChars, ",");
    floatCircleX = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatCircleY = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatCircleR = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatCircleTheta = atof(strtokIndx);

    strtokIndx = strtok(NULL, ";");
    floatCircleGamma = atof(strtokIndx);
  }
}
