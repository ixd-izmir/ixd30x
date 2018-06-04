// ixd307f17 | week12: in-class exercise
// slightly modified version of Ex7-3 and Ex7-4 
// Getting Started with Processing, Reas&Fry

// demonstrates fluid continuous motion and response to canvas boundaries 

int radius = 40;
float xPacman = -radius;
float speed = 1.5;

void setup() { 
  size(240, 480); 
  ellipseMode(RADIUS);
  smooth();
  noStroke();
  //frameRate(10);
}

void draw() {
  if (!mousePressed) { // bonus: stretch the pacman! :)
    background(#E3E3DE);
  }
  
  xPacman = xPacman + speed; // same as xPacman += speed;
  
  if (xPacman >= width+(radius*2)) {
    xPacman = -radius; 
  }
  
  fill(#E85959);
  arc(xPacman, 60, radius, radius, 0.52, 5.76);
  fill(#46E8D9);
  arc(xPacman, radius*4, radius/2, radius/2, 0.52, 5.76);
  fill(#F9FA44);
  arc(xPacman, radius*10, radius*2, radius*2, 0.52, 5.76);
 
  println(xPacman);
}