void DataInputKBFSA() {
  if (key == 'X') {
    point = 'x';
  } else if (key == 'Y') {
    point = 'y';
  } else if (key == 'A') {
    point = 'a';
  } else if (key == 'B') {
    point = 'b';
  } else if (key == 'E') {
    EOI = true;
  } else if ((key == ENTER || key == RETURN) && EOI == false) {
    if (key != ' ') {
      num = float( str_num );
      str_num = "";
    }
  } else if ((key == ENTER || key == RETURN) && EOI) {
    LineCreation();
  } else {
  }

  if (num != 0) {

    if (point == 'x') {
      InputXAxis.append(num);
      println('X', InputXAxis.get(InputXAxis.size()-1));
      num = 0;
      point = ' ';
    }
    if (point == 'y') {
      InputYAxis.append(num);
      println('Y', InputYAxis.get(InputYAxis.size()-1));
      num = 0;
      point = ' ';
    }
    if (point == 'a') {
      InputXAxis.append(num);
      if (InputYAxis.size() != 0) {
        InputYAxis.append(InputYAxis.get(InputYAxis.size()-1));
      }
      println('X', InputXAxis.get(InputXAxis.size()-1));
      num = 0;
      point = ' ';
    }
    if (point == 'b') {
      InputYAxis.append(num);
      if (InputXAxis.size() != 0) {
        InputXAxis.append(InputXAxis.get(InputXAxis.size()-1));
      }
      println('Y', InputYAxis.get(InputYAxis.size()-1));
      num = 0;
      point = ' ';
    }
  }

  if ( (key >= '0' && key <= '9' ) || key == '.') {
    str_num += key;
  }
}

void DataInputMFSA(){
  if(mouseButton == LEFT){
    InputXAxis.append(mouseX);
    InputYAxis.append(mouseY);
  }
  else{
    InputXAxis.remove(InputXAxis.size()-1);
    InputYAxis.remove(InputYAxis.size()-1);
  }
}
