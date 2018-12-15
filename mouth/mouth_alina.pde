import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
Arduino pasta; 

void setup(){
   size(640, 360);  // Size must be the first statement
   stroke(255);     // Set line drawing color to white
   frameRate(30);
   pasta = new Arduino(this, "/dev/cu.usbmodem1421", 57600);
   pasta.pinMode(3, Arduino.SERVO);
   pasta.servoWrite(3, 0);
}

void draw(){
  background(0);
  //set back to 0 for all
  if(mouseY > height/2){
    pasta.servoWrite(3, 100);
  }else{
    pasta.servoWrite(3, 0);
  }
}
