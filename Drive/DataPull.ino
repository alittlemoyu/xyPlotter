void lineDataPull() {
  Serial.write('L');
  if (Serial.available() > 0) {
    answer = Serial.read();
   if (answer == 'E')
    {
      EOLS = true;
    }
  }
}
void arcDataPull() {
  Serial.write('A');
  if (Serial.available() > 0) {
    answer = Serial.read();
   if (answer == 'E')
    {
      EOAS = true;
    }
  }
}
