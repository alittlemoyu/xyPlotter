void KBInterruption(){
  if((LineCreationProcedure == false) && ArcCreationProcedure == false){
    DataInputFSA();
  }
  else if(LineCreationProcedure == true){
    LineCreationFSA();
  }
  else if(ArcCreationProcedure == true){
    ArcCreationFSA();
  }
  else{loop();}
}
