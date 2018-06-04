
// ixd307f17
// author: Ceren Kayalar

// [03.10.2017] demonstrates if-else, variables, mousePressed, mouseButton
// [06.10.2017] bounds of a circle and a square

int offset; // you can define your variables outside of setup() and draw()

void setup() {
  size(500,400);
  rectMode(CENTER);
  offset = 180; // intialize (assign the first value) the variables in setup()
}

void draw() {
  background(120);
  
  if (mousePressed) {
    fill(0, 255, 0);
  } else {
    fill (255, 0, 0);
  }
  
  int diameter; // definition of a variable
  diameter = 120; // assigning a value (120) to a variable (diameter)
  //int diameter = 120; // definition and initialization can be done in one line
  
  ellipse(mouseX,mouseY, diameter*2, diameter*2);
  ellipse(mouseX-60,mouseY-60, diameter, diameter);
  ellipse(mouseX-40,mouseY-40, diameter, diameter);
  ellipse(mouseX-20,mouseY-20, diameter, diameter);
  
  diameter = 60;
  
  ellipse(mouseX+20,mouseY+20, diameter, diameter);
  ellipse(mouseX+40,mouseY+40, diameter, diameter);
  ellipse(mouseX+60,mouseY+60, diameter, diameter);
  
  diameter = 30;
  
  if (mousePressed) {
    if (mouseButton == RIGHT) {
       strokeWeight(10);
    } else // is executed if (mouseButton == LEFT)
    {
      strokeWeight(2);
    }
  }
  
  diameter = 60;
  
  // testing the bounds of a square:
  if ((mouseX < width/2 + diameter/2) && (width/2 - diameter/2 < mouseX) 
    && (mouseY < height/2 + diameter/2) && (height/2 - diameter/2 < mouseY)) { 
    fill(0, 0, 255); 
  } 
  else
  { 
    fill (255, 0, 0);
  }
  rect(width/2, height/2, diameter, diameter); // draw a rectangle on the center of canvas
 
  // testing the bounds of a circle:
  if (dist(mouseX, mouseY, width/2, height/2) < diameter/2) {
    /* if the distance between the mouse position and the center 
     is less than the radius (diameter/2) of the circle (= mouse is inside the circle!)
     then fill blue
    */
    fill (0, 0, 255);
  } else {
    fill (255, 0, 0);
  }
  ellipse(width/2, height/2, diameter, diameter); // draw a circle on the center of the canvas
  
}