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

boolean eyesRight = false;
boolean eyesLeft = false;


void setup(){
  size(640, 480);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw(){
  background(0);
  
  
    
String[] readd = loadStrings("../Writer_Graphics/tezt.txt");
String[] sec = loadStrings("../Writer_Graphics/hzi.txt");


for (int i = 0; i < sec.length; i++){
    boolean gd = boolean(sec[i]);
    //println(gd);
    eyesRight = gd;
 }

for (int i = 0; i < readd.length; i++){
    boolean gdd = boolean(readd[i]);
    //println(gd);
    eyesLeft = gdd;
 }

  
  //eyebrows
  fill(101,111,22);
  if(keyCode == UP){
     yPos++; 
  }else if (keyCode == DOWN){
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
  
  //eyes
  fill(107, 145, 189);
  
  
  
  ///*******
   if(eyesRight == true){
     xPos++; 
  }else if(eyesLeft == true){
    xPos--;
  }
  
  /*
  if(keyCode == LEFT){
     xPos++; 
  }else if(keyCode == RIGHT){
    xPos--;
  }
  */
  
  //******
  
  
  
    
  ellipse(width/3 - xPos, 175, 75, 75);
  ellipse(2 * width/3 - xPos, 175, 75, 75);
  
}
