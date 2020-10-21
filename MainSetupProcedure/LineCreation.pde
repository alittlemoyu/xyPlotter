boolean LineCreationProcedure = false;

void LineCreation(){
  LineCreationProcedure = true;
}

class LinePointPair{
  
  int XNo;
  int YNo;
  
  LinePointPair(int XNo,int YNo){
    this.XNo = XNo;
    this.YNo = YNo;
  }
  
  void drawLine(){
    line(InputXAxis.get(XNo-1),InputYAxis.get(XNo-1),InputXAxis.get(YNo-1),InputYAxis.get(YNo-1));
  }
  
}
