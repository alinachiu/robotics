import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

boolean closeEnough = false;

//for eyebrows
int screenArea = 307200;
int faceWidth;
int faceHeight;
int faceArea;
int servoPin7 = 7;
int servoPin13 = 13;
int frames =1080;

//for eye blink
int servoPin1 = 1;
int servoPin2 = 2;
int eyeFrames = 720;

//for eyeball
int servoPin3 = 3;
int servoPin4 = 4;
int trackX;
int angle;

//mouth
int servoPin8 = 8;
int mouthFrames =1080;

//arrays
int[] eyebrows = new int[1080];
int[] mouth = new int[1080];
int [] blinkSequence = new int[eyeFrames];



//init arduino
Arduino demon;


void setup() {
  frameRate(60);
  size(640, 480);  
  
  println(Arduino.list());
  demon = new Arduino(this, "/dev/tty.usbmodem1411", 57600);
  
  //eyebrows
  demon.pinMode(servoPin7, Arduino.SERVO);
  demon.pinMode(servoPin13, Arduino.SERVO);
  
  //eye blink
  demon.pinMode(servoPin1, Arduino.SERVO);
  //demon.pinMode(servoPin2, Arduino.SERVO);
  
  //eyeball
  demon.pinMode(servoPin3, Arduino.SERVO);
  demon.pinMode(servoPin4, Arduino.SERVO);
  
  //mouth
  
  demon.pinMode(servoPin8, Arduino.SERVO);
  
  String[] cameras = Capture.list();
  println(cameras);
  //video = new Capture(this, 640/2,480/2, cameras[15]);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

  video.start();
  
  initEyebrows();
  initBlink();
  initMouth();
}

void initEyebrows(){
    for (int i=0;i<frames;i++){
      if (i<540){
        eyebrows[i] = 0;
        closeEnough = true;
      }
      else{
        eyebrows[i] =45;
        closeEnough = false;
      }
  }
}

void initBlink(){
    for (int i=0;i<eyeFrames;i++){
      if(i<360){
          blinkSequence[i] =100;
      }
     else{
       blinkSequence[i] = 0;
     }
      println(blinkSequence[i]);
   }
}

void initMouth(){
    for (int i=0;i<mouthFrames;i++){
      if (i<360){
        mouth[i] = 0;
      }
      else if (i>720){
        mouth[i] =0;
      }
      else{
        mouth[i] =90;
      }
  }
}
void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
   
    faceWidth = faces[i].width;
    faceHeight = faces[i].height;
    faceArea = faceWidth * faceHeight;
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    trackX = (faces[i].x + faces[i].width/2);
    println(faceArea);
  }
  
  eyeballs();
  
  if (faceArea >= 5000){
         closeEyebrows();
         //openMouth();
    }
    
     //intermittentBlink();
  }
  

void closeEyebrows(){
    for (int c=0;c<frames;c++){
     demon.servoWrite(servoPin7,eyebrows[c]);
     demon.servoWrite(servoPin13,eyebrows[c]);
     //delay(17);
  }
}

void openMouth(){
  for (int c=0;c<mouthFrames;c++){
    demon.servoWrite(servoPin8, mouth[c]);
  }
}

void intermittentBlink(){
    for(int i=0;i<eyeFrames;i++){
    demon.servoWrite(servoPin1, blinkSequence[i]);
    demon.servoWrite(servoPin2, blinkSequence[i]);
    //delay(17);
  }
}

void eyeballs() {
    //starting face detection
    Rectangle[] faceDetect = opencv.detect();
    if (faceDetect.length>0) {
      if (faceDetect[0].x >=0 && faceDetect[0].x <=720 && faceDetect[0].y >=0 && faceDetect[0].y <=480) {
        //divides and constrains the x value of your face to between 0-180 degrees
        angle = constrain((trackX/4),0,180);
        //makes the servo move to the required angle to "track" face
        demon.servoWrite(servoPin3, angle);
        demon.servoWrite(servoPin4, angle);
        //demon.servoWrite(servoPin13, angle);
        //a check
        println("X position of face is: " + trackX);
        println("angle of motor is: " + angle);
        //delay(17); //17
        }
    }
  }

void captureEvent(Capture c) {
  c.read();
}
