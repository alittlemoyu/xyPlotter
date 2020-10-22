void KBInterruption(){
  if(LineCreationProcedure == false){
    
    DataInputFSA();
    
  }
  else if(LineCreationProcedure == true){
    
    LineCreationFSA();
    
  }
  else if(ArcCreationProcedure == true){
  
    ArcCreationFSA();
  
  }
  else{}
}
