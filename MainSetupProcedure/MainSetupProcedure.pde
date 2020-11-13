import processing.serial.*;
float num = 0;
float arcPrecession = 0.1;
int LCPairCount, ACPairCount = 0;
String No_buffer="";
String str_num = "";
FloatList InputXAxis, InputYAxis, DispXAxis, DispYAxis;
char point = 'x';
boolean EOI = false;
boolean EOLC = false;
boolean EOAC = false;
boolean SetupDone = false;
IntList InputLCBuffer, InputACBuffer;
int PairCount = 0;
LinePointPair[] pointPair;
CircleAxis[] circleAxis;
boolean LineCreationProcedure = false;
boolean ArcCreationProcedure = false;
String words1 = "Preview on the A4 paper";
String words2 = "The data you input";
int indentation = 90;
int line_spacing = 30;
String data = "";
int initial_indentation = 1270;
int line = 30;
boolean contactEstablished = false;
boolean pushFinished = false;
boolean EOLS = false;
boolean EOAS = false;
Serial myPort;
String SerialVal;
char inByte;
int serialPushCount = 0;
boolean needDrawLineTemp = true;
boolean needPointEmphasis = false;
int minno;
//boolean 紙片人好看 = true；
boolean DispAxisIsCount = false;


public void setup() {
  textFont(createFont("CALIBRI.TTF", 36));
  //size(1920,1080);
  fullScreen();
  InputXAxis = new FloatList();
  InputYAxis = new FloatList();
  DispXAxis = new FloatList();
  DispYAxis = new FloatList();
  InputLCBuffer = new IntList();
  InputACBuffer = new IntList();
  myPort = new Serial(this, "COM4", 115200);
  myPort.buffer(1);
}

public void draw() {
  background(125, 125, 125);
  noStroke();
  fill(255, 255, 255);
  textSize(45);
  text(words1, 30, 60);
  translate(30, 120);
  rect(0, 0, 1188, 840);
  translate(1170, -120);
  fill(254, 253, 225);
  rect(50, 0, 600, height);
  rotate(HALF_PI);
  fill(255);
  textSize(36);
  text(words2, 20, -675);
  rotate(-HALF_PI);
  if (DispAxisIsCount == false){
    DispAxis();
  }
  NumPad();
  GraphicsPad();
  LCNumPair();
  if (EOLC) {
    DrawLine();
    needDrawLineTemp = false;
  }
  if (needDrawLineTemp){
    DrawLineTemp();
  }
  if (EOAC) DrawArc();
}

public void keyPressed() {
  KBInterruption();
}

void mousePressed(){
  MInterruption();
}

void serialEvent(Serial myPort) {
  serialInterruption(myPort);
}
