void KBInterruption() {
  if ((LineCreationProcedure == false) && ArcCreationProcedure == false) {
    DataInputKBFSA();
  } else if (LineCreationProcedure == true) {
    LineCreationKBFSA();
  } else if (ArcCreationProcedure == true) {
    ArcCreationKBFSA();
  }
}

void MInterruption(){
  if ((LineCreationProcedure == false) && ArcCreationProcedure == false) {
    DataInputMFSA();
  } else if (LineCreationProcedure == true) {
    LineCreationMFSA();
  } else if (ArcCreationProcedure == true) {
    ArcCreationMFSA();
  }
}
