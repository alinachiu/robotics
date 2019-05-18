/*
This program goes with FaceCommuninator. (I know I probably spelled that wrong). Press the a
arrow keys on FaceCommuninator to move the eyes and eyebrows and stuff. Also, you might have
to change the paths on lines 39-42 for it to work. The mouth is controlled from this 
program, not the other one.
*/


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

boolean browsUp = false;
boolean browsDown = false; 


void setup(){
  size(640, 480);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw(){
  background(0);
  
  
    
String[] readd = loadStrings("../FaceCommuninator/tezt.txt");
String[] sec = loadStrings("../FaceCommuninator/hzi.txt");
String[] upp = loadStrings("../FaceCommuninator/up.txt");
String[] downn = loadStrings("../FaceCommuninator/down.txt");


for (int i = 0; i < sec.length; i++){
    boolean gd = boolean(sec[i]);
    //println(gd);
    eyesLeft = gd;
 }

for (int i = 0; i < readd.length; i++){
    boolean gdd = boolean(readd[i]);
    //println(gd);
    eyesRight = gdd;
 }

for (int i = 0; i < upp.length; i++){
    boolean gddd = boolean(upp[i]);
    //println(gd);
    browsUp = gddd;
 }
  
for (int i = 0; i < downn.length; i++){
    boolean gdddd = boolean(downn[i]);
    //println(gd);
    browsDown = gdddd;
 }

  //eyebrows
  fill(101,111,22);
  
  if(browsUp == true){
     yPos++; 
  }else if (browsDown == true){
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

    
  ellipse(width/3 - xPos, 175, 75, 75);
  ellipse(2 * width/3 - xPos, 175, 75, 75);
  
}
