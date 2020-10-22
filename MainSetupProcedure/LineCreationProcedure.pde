void LineCreationFSA(){
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
      No_buffer = "";
    }
  }
  else if(key == 'E'){
    PairCount = 0;
    EOLC = true;
    pointPair = new LinePointPair[LCPairCount];
    for (int count = 0; count <= LCPairCount-1; count++){
      pointPair[count] = new LinePointPair(InputLCBuffer.get(count*2),InputLCBuffer.get(count*2+1));
    }
  }
  else if((key == ENTER || key == RETURN) & EOLC){
    ArcCreation();
  }
}
