void DataInputFSA(){
  if (key == 'X'){point = 'x';}
  else if (key == 'Y'){point = 'y';}
  else if (key == 'A'){point = 'a';}
  else if (key == 'B'){point = 'b';}
  else if (key == 'E'){
    EOI = true;
  }
  else if ((key == ENTER || key == RETURN) && EOI == false){
    num = float( str_num );
    println(num);
    str_num = "";
    noLoop();
  }
  else if((key == ENTER || key == RETURN) && EOI == true){
    noLoop();
    LineCreation();
  }
  else{}

  if(num != 0){
    
    if(point == 'x'){
      InputXAxis.append(num);
      println('X',InputXAxis.get(InputXAxis.size()-1));
      num = 0;
      loop();
    }
    if(point == 'y'){
      InputYAxis.append(num);
      println('Y',InputYAxis.get(InputYAxis.size()-1));
      num = 0;
      loop();
    }
    if(point == 'a'){
      InputXAxis.append(num);
      if (InputYAxis.size() != 0){
        InputYAxis.append(InputYAxis.get(InputYAxis.size()-1));
      }
      println('X',InputXAxis.get(InputXAxis.size()-1));
      num = 0;
      loop();
    }
    if(point == 'b'){
      InputYAxis.append(num);
      if (InputXAxis.size() != 0){
        InputXAxis.append(InputXAxis.get(InputXAxis.size()-1));
      }
      println('Y',InputYAxis.get(InputYAxis.size()-1));
      num = 0;
      loop();
    }
    
  }
  
  if( (key >= '0' && key <= '9' ) || key == '.'){
    str_num += key;
  }
}
