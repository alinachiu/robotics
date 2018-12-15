import processing.serial.*;

import cc.arduino.*;
import org.firmata.*;

Arduino squirrel;

void setup(){
  println(Arduino.list());
  squirrel = new Arduino(this, "/dev/cu.usbmodem1431", 57600);
  squirrel.pinMode(7, Arduino.SERVO);
}

void draw(){
  if(mousePressed){
    background(255);
    squirrel.servoWrite(7,5);
  }
  else{
    background(50);
    squirrel.servoWrite(7, 175);
  }
}
