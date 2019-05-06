//press left key to show left eye and right key to show right eye
//press up key to move eyebrows up, down key to move eyebrows down
//move mouse up to move lip down move mouse down to move lip up

import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
boolean posEyebrows = true;
int yPos = 0;
int xPos = 0;
int yPosMouth = 25;

void setup(){
  size(640, 480);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw(){
  background(0);
  
  //eyebrows -- move up when mouseY is top, opposite for move down
  fill(101,111,22);
  if(keyCode == UP && yPos < 20){
     yPos++; 
  }else if (keyCode == DOWN && yPos > 2){
     yPos--;
  }
  
  if(yPos > 2){
    rect(width/4, 75 - yPos, 100, 20);
    rect(3 * width/5, 75 - yPos, 100, 20);
  }else{
    rect(width/4, 75 + yPos, 100, 20);
    rect(3 * width/5, 75 + yPos, 100, 20);
    yPos++;
  }
  
  //nose -- nothing, doesn't move
  fill(238,203,47);
  rect(8 * width/17, 3 * height/7, 40, 80);
  
  //mouth -- should have constant movement on sine function
  fill(238,194,195);
  rect(6.85 * width/17, 325, 120, 30);
  
  if(mouseY > height/2 && yPosMouth > -5){
    rect(6.85 * width/17, 375 + yPosMouth, 120, 30);
    yPosMouth--;
  }else{
    rect(6.85 * width/17, 375 + yPosMouth, 120, 30);
  }
  
  if(mouseY < height/2 && yPosMouth < 27){
    rect(6.85 * width/17, 375 + yPosMouth, 120, 30);
    yPosMouth++;
  }else if(yPos != 2){
    rect(6.85 * width/17, 375 + yPosMouth, 120, 30);
  }
  
  //eyes -- complete, moves when key is pressed
  fill(107, 145, 189);
  
  if(keyPressed == true && keyCode == LEFT && xPos < 40){
     xPos++;
  }else if(keyCode == RIGHT && keyPressed == true && xPos > -40){
    xPos--;
  } 
    
  ellipse(width/3 - xPos, 175, 75, 75);
  ellipse(2 * width/3 - xPos, 175, 75, 75);
  
}
