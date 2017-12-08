/*

*
* ixd307f17 | week12: in-class exercise

Remember the famous DVD screensaver <https://www.youtube.com/watch?v=B6mtmlX7Vrw>
( Recap from "The Office": <https://www.youtube.com/watch?v=vhxXCHhh9H8>) which the DVD
logo bounces around the screen and we all waited desperately for it to hit the corner? We
want you to replicate that screensaver, but only using a rectangle instead of the DVD logo.
When you start the app, the screen should be black and the rectangle should start at a random
location. Each time the rectangle hits the edges, it should change its color (and obviously
direction).

hint:
  void draw() {
      background(0);
      drawRect();
      move();
      detectCollision();
   }

*/

float x;
float y;

int w = 100;
int h = 60;

float speedX = 1.5;
float speedY = 2.5;

color c;

int count = 0;

PFont font;



void setup(){
  size(400, 400);
  x = random(width - w);
  y = random(height - h);
  colorMode(HSB, 255);
  c = color(180, 50, 200);
  noStroke();
  
  // 1 - Download and install the font: https://www.dafont.com/ds-digital.font
  // 2 - Create font from Tools->Create Font (size: 24) - don't rename it!
  // 3 - Check sketch folder/data if the font was created succesfully 
  font = loadFont("DS-Digital-24.vlw");
  textFont(font, 24);

}

void draw(){
  background(0);
  fill(c);
  rect(x, y, w, h, 8);
  x+= speedX;        
  y+= speedY;
  
  if((x > width-w) || (x < 0)) {
    speedX = -speedX;
    changeColor();
    count += 1; // count++; 
    // println("SCORE = ", count);
  }
  
  if((y>height-h) || (y<0)){
    speedY = -speedY;
    changeColor();
    count += 1;
    // println("SCORE = ", count);
  }
    
  String currentTimeStr = "TIME = " + millis()/1000;
  //println(currentTimeStr);
  fill(255);
  text(currentTimeStr, 10, 30); 
  text("SCORE = " + count, 10, 60);
 //println(x);
 
}

void changeColor(){
  c = color(random(255), 200, random(255));
}