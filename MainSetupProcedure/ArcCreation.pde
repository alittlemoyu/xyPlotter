void ArcCreation() { //<>// //<>//
  LineCreationProcedure = false;
  ArcCreationProcedure = true;
  println("Jump out to ArcCreation");
}

class CircleAxis {
  float x;
  float x0;
  float y;
  float y0;
  float r;
  float alpha;
  float theta;
  float gamma;
  FloatList circle;
  boolean printCalculation = false;
  float printx0;
  float printy0;
  float printr;

  CircleAxis(FloatList circle) {
    this.circle = circle;
    this.x0 = circle.get(0);
    this.y0 = circle.get(1);
    this.r = circle.get(2);
    this.alpha = circle.get(3);
    this.theta = circle.get(4);
    this.gamma = circle.get(5);
  }

  void arcPrinter() {
    stroke(0);
    noFill();
    if (printCalculation == false) {
      printx0 = 30+4*y0;
      printy0 = 120+4*x0;
      printr = r*8;
      printCalculation = true;
    }
    if (alpha != TWO_PI) {
      arc(printx0, printy0, printr, printr, theta, gamma);
    } else {
      circle(printx0, printy0, printr);
    }
  }

  void arcInfo() {
    println(x0, y0, r, alpha);
  }

  String arcSerial() {
    return '<'+str(x0)+','+str(y0)+';'+str(r)+';'+str(theta/PI)+';'+str(gamma/PI)+'>';
  }
}


FloatList CircleCalculator(int ellipse, int start, int end) {

  float x0 = InputXAxis.get(ellipse);
  float y0 = InputYAxis.get(ellipse);
  float x1 = InputXAxis.get(start);
  float x2 = InputXAxis.get(end);
  float y1 = InputYAxis.get(start);
  float y2 = InputYAxis.get(end);
  float r = sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0));
  float theta = atan2((x1-x0), (y1-y0));
  float gamma = atan2((x2-x0), (y2-y0));
  float alpha = gamma - theta;
  if (alpha == 0) {
    alpha = TWO_PI;
  }
  FloatList circle =  new FloatList();
  println(x0, y0, x1, y1, x2, y2, r, alpha);

  circle.append(x0);
  circle.append(y0);
  circle.append(r);
  circle.append(alpha);
  circle.append(theta);
  circle.append(gamma);

  return circle;
}
