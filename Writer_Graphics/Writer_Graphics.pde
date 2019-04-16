//String[] lisst;

void setup(){
  
    String[] lisst = {"false"};
    saveStrings("tezt.txt", lisst);
    String[] sec = {"false"};
    saveStrings("hzi.txt", lisst);

}
void draw(){
  String[] upp = {"true"};
  String[] down = {"false"};
  String[] right = {"true"};
  String[] left = {"true"};


  if (keyPressed == true){
    if (key == CODED){
      /*
      if (keyCode == UP){
        saveStrings("tezt.txt", upp);
      }else if(keyCode == DOWN){
        saveStrings("tezt.txt", down);
      }else */if(keyCode == RIGHT){
        saveStrings("hzi.txt", right);
      }else if(keyCode == LEFT){
        saveStrings("tezt.txt", left);
    //saveStrings("test.txt", noww);
      }
    }
  }else{
    saveStrings("tezt.txt", down);
    saveStrings("hzi.txt", down);
  }
  
}
  /*
  String[] readd = loadStrings("tet.txt");
  for (int i = 0; i < readd.length; i++){
   // println(readd[i]);
  }
  //delay(1000);
}*/
