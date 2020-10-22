boolean ArcCreationProcedure = false;
float arcPrecession = 0.1;

void ArcCreation(){
  LineCreationProcedure = false;
  ArcCreationProcedure = true;
}

class CircleAxis{
  float x;
  float x0;
  float y;
  float y0;
  float r;
  float alpha;
  float theta;
  float gamma;
  FloatList circle;
  
  CircleAxis(FloatList circle){
    this.circle = circle;
    this.x0 = circle.get(0);
    this.y0 = circle.get(1);
    this.r = circle.get(2);
    this.alpha = circle.get(3);
    this.theta = circle.get(4);
    this.gamma = circle.get(5);
  }
  
  void arcPrinter(){
    arc(x0,y0,r,r,theta,gamma);
  }
  void arcCreator(){
    //使用arcPrecession創建x表，並協同計算出y。
  }
  
}
