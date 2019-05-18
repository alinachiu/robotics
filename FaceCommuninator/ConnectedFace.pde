//String[] lisst;
/*
This program goes wiht ConnectedFace and takes arrow key imput to
move the mouth and eyes. The other program moves the mouth. 

*/
void setup(){
  
    String[] lisst = {"false"};
    saveStrings("tezt.txt", lisst);
    String[] sec = {"false"};
    saveStrings("hzi.txt", lisst);
    
    String[] up = {"false"};
    saveStrings("up.txt", lisst);
    String[] down = {"false"};
    saveStrings("down.txt", lisst);

}
void draw(){
  String[] fake = {"false"};
  String[] real = {"true"};

  if (keyPressed == true){
    if (key == CODED){
       if(keyCode == RIGHT){
          saveStrings("hzi.txt", real);
        }else if(keyCode == LEFT){
          saveStrings("tezt.txt", real);
          //saveStrings("test.txt", noww);
      }
    }
  }else{
    saveStrings("tezt.txt", fake);
    saveStrings("hzi.txt", fake);
  }

  if (keyPressed == true){
    if (key == CODED){
       if(keyCode == UP){
          saveStrings("up.txt", real);
        }else if(keyCode == DOWN){
          saveStrings("down.txt", real);
          //saveStrings("test.txt", noww);
      }
    }
  }else{
    saveStrings("up.txt", fake);
    saveStrings("down.txt", fake);
  }
}
