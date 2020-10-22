void ArcCreationFSA(){
  if(key >= '0' && key <= '9'){
      No_buffer += key;
    }
  else if(key == ' '){
    InputACBuffer.append(int(No_buffer));
    No_buffer = "";
  }
  else if(key == ENTER || key == RETURN){
    int remainder = InputACBuffer.size() % 3;
    switch(remainder){
      case 2:
        InputACBuffer.append(int(No_buffer));
        No_buffer = "";
        PairCount += 1;
        ACPairCount = PairCount;
      case 1:
        InputACBuffer.remove(InputACBuffer.size()-remainder);
        No_buffer = "";
      case 0:
        No_buffer = "";
    }
  }
  else if(key == 'E'){
    PairCount = 0;
    EOLC = true;
    circleAxis = new CircleAxis[ACPairCount];
    for (int count = 0; count <= ACPairCount-1; count++){
      circleAxis[count] = new CircleAxis(CircleCalculator(count*3,count*3+1,count*3+2));
    }
  }
  else if((key == ENTER || key == RETURN) & EOLC){
    ArcCreation();
  }
}

FloatList CircleCalculator(int ellipse,int start,int end){
  
  //float a,b,c,d,e,f; 
  //float x1 = InputXAxis.get(no1);
  //float x2 = InputXAxis.get(no2);
  //float x3 = InputXAxis.get(no3);
  //float y1 = InputYAxis.get(no1);
  //float y2 = InputYAxis.get(no2);
  //float y3 = InputYAxis.get(no3);
  
  //a = x1-x2;
  //b = y1-y2;
  //c = x1-x3;
  //d = y1-y3;
  //e = (x1*x1-x2*x2)-(y2*y2-y1*y1)/2;
  //f = (x1*x1-x3*x3)-(y3*y3-y1*y1)/2;
  //float x0 = -(d*e-b*f)/(b*c-a*d);
  //float y0 = -(a*f-c*e)/(b*c-a*d);
  //float r = sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0));
  //FloatList circle =  new FloatList();
  //circle.append(x0);
  //circle.append(y0);
  //circle.append(r);
  //return circle;
  float x0 = InputXAxis.get(ellipse);
  float y0 = InputYAxis.get(ellipse);
  float x1 = InputXAxis.get(start);
  float x2 = InputXAxis.get(start);
  float y1 = InputYAxis.get(end);
  float y2 = InputYAxis.get(end);
  float r = sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0));
  float theta = acos((x1-x0)/(y1-y0));
  float gamma = acos((x2-x0)/(y2-y0));
  float alpha = gamma - theta;
  FloatList circle =  new FloatList();
  circle.append(x0);
  circle.append(y0);
  circle.append(r);
  circle.append(alpha);
  circle.append(theta);
  circle.append(gamma);
  return circle;
}
