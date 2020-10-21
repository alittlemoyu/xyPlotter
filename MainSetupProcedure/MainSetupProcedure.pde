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

  if(LineCreationProcedure == false){
    
    if (key == 'X'){point = 'x';}
    else if (key == 'Y'){point = 'y';}
    else if (key == 'A'){point = 'a';}
    else if (key == 'B'){point = 'b';}
    else if (key == 'E'){
      EOI = true;
    }
    else if ((key == ENTER || key == RETURN) && EOI == false){
      num = float( str_num );
      println(num);
      str_num = "";
      noLoop();
    }
    else if((key == ENTER || key == RETURN) && EOI == true){
      noLoop();
      LineCreation();
    }
    else{}
  
    if(num != 0){
      
      if(point == 'x'){
        InputXAxis.append(num);
        println('X',InputXAxis.get(InputXAxis.size()-1));
        num = 0;
        loop();
      }
      if(point == 'y'){
        InputYAxis.append(num);
        println('Y',InputYAxis.get(InputYAxis.size()-1));
        num = 0;
        loop();
      }
      if(point == 'a'){
        InputXAxis.append(num); //<>//
        if (InputYAxis.size() != 0){
          InputYAxis.append(InputYAxis.get(InputYAxis.size()-1));
        }
        println('X',InputXAxis.get(InputXAxis.size()-1));
        num = 0;
        loop();
      }
      if(point == 'b'){
        InputYAxis.append(num); //<>//
        if (InputXAxis.size() != 0){
          InputXAxis.append(InputXAxis.get(InputXAxis.size()-1));
        }
        println('Y',InputYAxis.get(InputYAxis.size()-1));
        num = 0;
        loop();
      }
      
    }
    
    if( (key >= '0' && key <= '9' ) || key == '.'){
      str_num += key;
    }
    
  }
  else if(LineCreationProcedure == true){
    if(key >= '0' && key <= '9'){
      No_buffer += key;
    }
    else if(key == ' '){
      InputLCBuffer.append(int(No_buffer));
      No_buffer = "";
    }
    else if(key == ENTER || key == RETURN){
      if (InputLCBuffer.size() % 2 == 1){
        InputLCBuffer.append(int(No_buffer));
        No_buffer = "";
        PairCount += 1;
        LCPairCount = PairCount;
      }
      else{
        InputLCBuffer.remove(InputLCBuffer.size()-1);
      }
    }
    else if(key == 'E'){
      PairCount = 0;
      pointPair = new LinePointPair[LCPairCount];
      for (int count = 0; count <= LCPairCount-1; count++){
        pointPair[count] = new LinePointPair(InputLCBuffer.get(count*2),InputLCBuffer.get(count*2+1));
      }
    }
    else {}
  }
  else if(){}
  else{}
  
}
