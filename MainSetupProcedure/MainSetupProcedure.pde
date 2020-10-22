float num = 0;
int LCPairCount = 0;
String No_buffer="";
String str_num = "";
FloatList InputXAxis,InputYAxis;
char point = 'x';
boolean EOI = false;
IntList InputLCBuffer;
int PairCount = 0;
LinePointPair[] pointPair;

void setup(){
  size(1900,1000);
  textFont(createFont("CALIBRI.TTF", 36));
  InputXAxis = new FloatList();
  InputYAxis = new FloatList();
  InputLCBuffer = new IntList();
}

void draw(){
  background(125,125,125);
  noStroke();
  fill(255,255,255);
  rect(100,80,1188,840);
  textSize(36);
  text(words1, 100, 50);
  fill(254,253,225);
  rect(1350,80,500,840);
  text(words2,1575,50);
  NumPad();
  GraphicsPad();
  if (LCPairCount != 0) {DrawLine();}
}

void keyPressed(){
  KBInterruption(); //<>// //<>//
}
