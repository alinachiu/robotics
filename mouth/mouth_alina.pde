import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
Arduino pasta; 

int jaylina = 0;
boolean movingUp = true;

void setup(){
   size(640, 360);  // Size must be the first statement
   stroke(255);     // Set line drawing color to white
   frameRate(30);
   pasta = new Arduino(this, "/dev/cu.usbmodem14201", 57600);
   pasta.pinMode(7, Arduino.SERVO);
   pasta.servoWrite(7, 0);
}

void draw(){
  background(0);
  //set back to 0 for all
  if(mouseY > height/2 && jaylina < 180 && movingUp){
    pasta.servoWrite(7, jaylina);
    jaylina += 10;
  }else if(jaylina == 180){
    movingUp = false;
  }else if(mouseY < height/2 && jaylina > 180 && !movingUp){
    pasta.servoWrite(7, jaylina);
    jaylina -= 10;
  }
  
  if(jaylina == 0) movingUp = true;
}
