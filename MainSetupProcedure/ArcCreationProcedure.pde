void ArcCreationFSA(){
  PairCount = 0; 
  if(key >= '0' && key <= '9'){
    No_buffer += key;
    println("No_buffer "+No_buffer);
  }
  else if(key == ' '){
    InputACBuffer.append(int(No_buffer));
    println("InputACBuffer.size() "+InputACBuffer.size());
    No_buffer = "";
  }
  else if(key == ENTER || key == RETURN){
    int remainder = InputACBuffer.size() % 3;
    switch(remainder){
      case 0:
        No_buffer = "";
      case 1:
        InputACBuffer.remove(InputACBuffer.size()-remainder);
        No_buffer = "";
        println("OH NO");
      case 2:
        InputACBuffer.append(int(No_buffer));
        println("InputACBuffer.size() "+InputACBuffer.size());
        No_buffer = "";
        PairCount += 1;
        ACPairCount = PairCount;
        println("Succeed in BufferAppend.");

    }
  }
  else if(key == 'E'){
    EOAC = true;
    circleAxis = new CircleAxis[ACPairCount];
    println(InputACBuffer.size());
    println(InputACBuffer.get(0),InputACBuffer.get(1),InputACBuffer.get(2));
    for (int count = 0; count <= ACPairCount-1; count++){
      circleAxis[count] = new CircleAxis(CircleCalculator(InputACBuffer.get(count*3),InputACBuffer.get(count*3+1),InputACBuffer.get(count*3+2)));
      println("Succeed in circle creation.");
      circleAxis[count].arcInfo();
    }
    println("Arc input fininsed");
  }
  else if((key == ENTER || key == RETURN) && EOAC){
    //下一步
  }
}
