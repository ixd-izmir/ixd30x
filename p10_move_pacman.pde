// ixd307f17
// in-class example from the book: Getting Started with Processing, Reas&Fry

// demonstrates fluid continuous motion and response to canvas boundaries 

int radius = 40;
float xPacman = -radius;
float speed = 1.5;

void setup() { 
  size(240, 480); 
  ellipseMode(RADIUS);
  smooth();
  //frameRate(10);
}

void draw() {
  background(0);
  
  xPacman = xPacman + speed; // same as xPacman += speed;
  
  if (xPacman >= width+(radius*2)) {
    xPacman = -radius; 
  }
  
  arc(xPacman, 60, radius, radius, 0.52, 5.76);
  arc(xPacman, radius*4, radius/2, radius/2, 0.52, 5.76);
  arc(xPacman, radius*10, radius*2, radius*2, 0.52, 5.76);
 
  println(xPacman);
}