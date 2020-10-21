String words1 = "Preview on the A4 paper";
String words2 = "The data you input";int indentation = 90;
int line_spacing = 30;
String data = "";

void NumPad(){
  int initial_indentation = 1370;
  int line = 120;
  textSize(20);
  fill(51);
  for(int count = 0; count <= InputXAxis.size()-1;count++){
    data = str(count + 1) + "  X " + str(InputXAxis.get(count));
    text(data,initial_indentation,line);
    line += line_spacing;
    data = "";
  } 
  
  if (EOI){
    fill(255,0,0);
    text("Input Finished.ENTER to start LineCreation.",initial_indentation,line);
    noLoop();
  }
  
  line = 120;
  fill(51);
  for(int count = 0; count <= InputYAxis.size()-1;count++){
    data = "Y " + str(InputYAxis.get(count));
    text(data,initial_indentation + indentation,line);
    line += line_spacing;
    data = "";
  }
}

void GraphicsPad(){
  if (InputYAxis.size() >= 1){
    for(int count = 0; count <= InputYAxis.size()-1;count++){
      stroke(0);
      point(100+4*InputYAxis.get(count),80+4*InputXAxis.get(count));
    }
  }
}

void DrawLine(){
  for (int count = 0; count <= LCPairCount-1; count++){
    stroke(0);
    pointPair[count].drawLine();
  }
}
