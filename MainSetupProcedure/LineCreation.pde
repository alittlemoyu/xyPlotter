void LineCreation() {
  LineCreationProcedure = true;
  println("Jump out to LineCreation");
}

class LinePointPair {

  int ANo;
  int BNo;

  LinePointPair(int ANo, int BNo) {
    this.ANo = ANo;
    this.BNo = BNo;
  }

  void drawLine() {
    stroke(0);
    line(DispXAxis.get(ANo), DispYAxis.get(ANo), DispXAxis.get(BNo), DispYAxis.get(BNo));
  }

  String SerialVal() {
    return "<"+str(DispXAxis.get(ANo))+','+str(DispYAxis.get(ANo))+';'+str(DispXAxis.get(BNo))+','+str(DispYAxis.get(BNo))+'>';
  }
}
