import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
boolean position = true;

void setup(){
  size(640, 480);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}

void draw(){
  background(0);
  
  //eyebrows
  rect(width/4, 75, 100, 20);
  rect(3 * width/5, 75, 100, 20);
  //eyes
  ellipse(width/3, 175, 75, 75);
  ellipse(2 * width/3, 175, 75, 75);
  //nose
  rect(8 * width/17, 3 * height/7, 40, 80);
  //mouth
  rect(6.85 * width/17, 325, 120, 30);
  rect(6.85 * width/17, 375, 120, 30);
}
