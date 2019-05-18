//String[] readd = loadStrings("xm22485-MAC/Users/xochitl/Documents/Processing/tester_1/test.txt");
//String[] readd = loadStrings("test.txt");
//ignore these top comments

void draw(){

  String[] readd = loadStrings("/Users/xochitl/Documents/SquirrelPython/pythonTest.txt");


  /*LOADED FILE MUST BE IN PROCESSING DOCUMENT FOLDER????*/
  for (int i = 0; i < readd.length; i++){
    boolean g = boolean(readd[i]);

    
    if (g == false){
      background(0);
    }else if(g == true){
      background(255);
    }
  }


}
