//press left key to show left eye and right key to show right eye
//press up key to move eyebrows up, down key to move eyebrows down
//move mouse up to move lip down move mouse down to move lip up

import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
boolean posEyebrows = true;
int yPos = 25;
int yPosMouth = 25;

void setup(){
  size(640, 480);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw(){
  background(0);
  
  //eyebrows
  fill(101,111,22);
  if(keyCode == UP){
     yPos++; 
  }else{
    yPos--;
  }
  if(posEyebrows && yPos > 2){
    rect(width/4, 75 - yPos, 100, 20);
    rect(3 * width/5, 75 - yPos, 100, 20);
  }else{
    rect(width/4, 75 + yPos, 100, 20);
    rect(3 * width/5, 75 + yPos, 100, 20);
    yPos++;
  }
  
  
  //eyes
  fill(97,212,230);
  if(keyCode == LEFT){
    ellipse(width/3, 175, 75, 75);
  }else{
    ellipse(2 * width/3, 175, 75, 75);
  }
  
  //nose
  fill(238,203,47);
  rect(8 * width/17, 3 * height/7, 40, 80);
  
  //mouth
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
  
}
