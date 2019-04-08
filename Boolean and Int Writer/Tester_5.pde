//String[] lisst;

void setup(){
    String[] lisst = {"true"};
    saveStrings("tet.txt", lisst);
    String[] sec = {"1"};
    saveStrings("hi.txt", lisst);

}
void draw(){
  String[] upp = {"true"};
  String[] down = {"false"};
  String[] right = {"1"};
  String[] left = {"2"};


  if (keyPressed == true){
    if (key == CODED){
      if (keyCode == UP){
        saveStrings("tet.txt", upp);
      }else if(keyCode == DOWN){
        saveStrings("tet.txt", down);
      }else if(keyCode == RIGHT){
        saveStrings("hi.txt", right);
      }else if(keyCode == LEFT){
        saveStrings("hi.txt", left);
    //saveStrings("test.txt", noww);
      }
    }
  }
  
  String[] readd = loadStrings("tet.txt");
  for (int i = 0; i < readd.length; i++){
   // println(readd[i]);
  }
  //delay(1000);
}
