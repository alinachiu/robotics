// The statements in the setup() function 
// execute once when the program begins
int yPos = 25;
void setup() {
  size(640, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}
// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() { 
  background(0);   // Clear the screen with a black background
  rect(width/3, height/3 - 50, 200, 50);
  
  if(mouseY > height/2 && yPos > 2){
    rect(width/3, height/3 + yPos, 200, 50);
    yPos -= 1;
  }else{
    rect(width/3, height/3 + yPos, 200, 50);
  }
  
  if(mouseY < height/2 && yPos < 25){
    rect(width/3, height/3 - yPos, 200, 50);
    yPos += 1;
  }else if(yPos != 2){
    rect(width/3, height/3 + yPos + 5, 200, 50);
  }
}
