
// source:
// https://forum.processing.org/two/discussion/25157/help-with-gravity-and-jumping#latest

float px = 200;
float py = 300;
float vx = 0;
float vy = 0;
float ax = 0;
float ay = 0;
 
boolean[] keys = { false, false }; 
// 0: LEFT
// 1: RIGHT
// ...
 
void setup() {
  size(400, 400);
}
 
void draw() {
  simulate();
  render();
}
 
void simulate() {
  ax = 0;
  if (keys[0])
    ax += .1;
  else
    ax = 0;
 // a different syntax of the if-else block:
 // ax += keys[0]?-.1:0;
  if (keys[1])
    ax += .1;
  else
    ax = 0; 
  //ax += keys[1]?.1:0;
  
  ay = .32;
  vx+=ax;
  vy+=ay;
  px+=vx;
  py+=vy;
  if( px<10){
    vx = 0;
    ax = 0;
    px = 10;
  }
  if( px>390){
    vx = 0;
    ax = 0;
    px = 390;
  }
 
  if (py>300 && px>100 && px<300) { 
    py=300; 
    vy=0; 
    ay=0;
  }
  if( py>420 ){
    px = 200;
    py = -100;
    ax = 0;
    vx = 0;
    vy = 10;
  }
}
 
void render() {
  background(64);
  strokeWeight(3);
  stroke(0);
  line(100, 300, 300, 300);
  noStroke();
  fill(0, 255, 0);
  rect(px-10, py-20, 20, 20);
  
  ellipse(0, 300, 10, 10);
  
}
 
void keyPressed(){
  if( keyCode == LEFT ){
    keys[0] = true;
  }
  if( keyCode == RIGHT ){
    keys[1] = true;
  }
  if( keyCode == UP ){
    vy = -10;
  }
}
 
void keyReleased(){
  if( keyCode == LEFT ){
    keys[0] = false;
  }
  if( keyCode == RIGHT ){
    keys[1] = false;
  }
}