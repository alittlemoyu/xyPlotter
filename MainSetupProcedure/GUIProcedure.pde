public void NumPad() {
  initial_indentation = 1270;
  line = 30;
  textSize(20);
  translate(-1200, 0);
  fill(51);
  for (int count = 0; count <= InputXAxis.size()-1; count++) {
    data = str(count) + "  X " + str(InputXAxis.get(count));
    text(data, initial_indentation, line);
    line += line_spacing;
    data = "";
  } 

  if (EOI && (EOLC == false)) {
    fill(255, 0, 0);
    text("Input Finished.ENTER to start LineCreation.", initial_indentation, line);
  }

  if (EOLC && (EOAC == false)) {
    fill(255, 0, 0);
    text("LCProcedure finished. Enter to start ArcCreation", initial_indentation, line);
  }

  if (EOAC) {
    fill(255, 0, 0);
    text("ArcCreation finished. Enter to start Print", initial_indentation, line);
  }

  line = 30;
  fill(51);

  for (int count = 0; count <= InputYAxis.size()-1; count++) {
    data = "Y " + str(InputYAxis.get(count));
    text(data, initial_indentation + indentation, line);
    line += line_spacing;
    data = "";
  }
}

public void GraphicsPad() {
  if (InputYAxis.size() >= 1) {
    for (int count = 0; count <= InputYAxis.size()-1; count++) {
      stroke(0);
      point(DispXAxis.get(count), DispYAxis.get(count));
    }
  }
}

public void DispAxis() {
  DispXAxis.clear();
  DispYAxis.clear();
  for (int count = 0; count < InputYAxis.size(); count++) {
    DispXAxis.append(30+4*InputYAxis.get(count));  
    DispYAxis.append(120+4*InputXAxis.get(count));
  }
  DispAxisIsCount = true;
}

public void LCNumPair() {
}

void DrawLineTemp(){
    for (int count = 0; count <= LCPairCount-1; count++) {
      //Draw lines temporary.
      line(DispXAxis.get(InputLCBuffer.get(count*2)),DispYAxis.get(InputLCBuffer.get(count*2)),DispXAxis.get(InputLCBuffer.get(count*2+1)),DispYAxis.get(InputLCBuffer.get(count*2+1)));
    }
}

void pointEmphasize(){
  //Point selected emphasizing
  
}

public void DrawLine() {
  for (int count = 0; count <= LCPairCount-1; count++) {
    pointPair[count].drawLine();
  }
  
}

public void DrawArc() {
  for (int count = 0; count <= ACPairCount-1; count++) {
    circleAxis[count].arcPrinter();
  }
}
