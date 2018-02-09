
// source:
// https://forum.processing.org/two/discussion/16594/can-multiple-keys-be-pressed-on-the-keyboard

float x=width/2;
float y=height/2;
float xvel=0;
float yvel=0;
float frict = 0.97;
float vel = 0.6;
 
 
boolean isLeft, isRight, isUp, isDown; 
 
void setup() {
  size(800, 800);
  background(0);
  frameRate(30);
 
  x=width/2;
  y=height/2;
}
 
void draw() {
 
  background(0);//cls
  x=x+xvel; 
  y=y+yvel;
  if (isLeft)xvel=xvel-frict;
  if (isRight)xvel=xvel+frict;
  if (isDown)yvel=yvel+frict;
  if (isUp)yvel=yvel-frict;
  yvel=yvel*frict;
  xvel=xvel*frict;
 
  rect(x, y, 50, 50);
}
 
void keyPressed() {
  setMove(keyCode, true);
}
 
void keyReleased() {
  setMove(keyCode, false);
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;
 
  case DOWN:
    return isDown = b;
 
  case LEFT:
    return isLeft = b;
 
  case RIGHT:
    return isRight = b;
 
  default:
    return b;
  }
}