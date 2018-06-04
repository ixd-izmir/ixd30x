import processing.serial.*;
import ddf.minim.*;

Minim minim;
Serial arduino;

AudioPlayer sound;
boolean playing= false;
boolean value= false;
String serialStr;

int num_of_consecutives = 0;
int buffer_length = 10;

void setup() {
  size(200, 200);
  minim = new Minim(this);
    
  sound = minim.loadFile("om2.mp3");

  println(Serial.list());
  arduino = new Serial(this, Serial.list()[1], 9600);
}


void draw() {
  
  background(0,0,0);
 
  if(!playing){
    sound.loop();
    playing=true;
  }
  
  while(arduino.available() > 0) {  // If data is available,
    serialStr= arduino.readString();
  }
  
  String tmp = trim(serialStr);
  //println(tmp); 

  if (tmp != null) { 
    if (tmp.charAt(0) == '1') {
        num_of_consecutives++;
    }else {
        num_of_consecutives--;
    } 
  }
  
  
  if (num_of_consecutives >= buffer_length) {
    num_of_consecutives = buffer_length;
    if(!sound.isPlaying())
        sound.loop();
    //println("on");
  }
  
  if (num_of_consecutives < -buffer_length) {
    num_of_consecutives = -buffer_length;
    //println("off");
    sound.pause();
    sound.rewind();
  }
}
