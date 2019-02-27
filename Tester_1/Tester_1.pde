//String[] lisst;

void setup(){
    String[] lisst = {"hi", "asd", "wer"};
    saveStrings("test.txt", lisst);
}
void draw(){
  String[] upp = {"up"};
  String[] down = {"down"};

  
  if (keyPressed == true){
    if (key == CODED){
      if (keyCode == UP){
        saveStrings("test.txt", upp);
      }else if(keyCode == DOWN){
        saveStrings("test.txt", down);
      }
    }
    //saveStrings("test.txt", noww);
  }
  
  String[] readd = loadStrings("test.txt");
  for (int i = 0; i < readd.length; i++){
    println(readd[i]);
  }
  delay(1000);
}
