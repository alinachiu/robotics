//String[] readd = loadStrings("xm22485-MAC/Users/xochitl/Documents/Processing/tester_1/test.txt");
//String[] readd = loadStrings("test.txt");
void draw(){

  
  String[] readd = loadStrings("../Tester_1/test.txt");
  for (int i = 0; i < readd.length; i++){
    println(readd[i]);
  }
  delay(1000);
}
