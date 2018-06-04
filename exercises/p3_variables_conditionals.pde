
// ixd307f17
// Oct 3 

// demonstrates if-else, variables, mousePressed, mouseButton

void setup() {
  size(500,400);
}

void draw() {
  background(120);
  /*if (mousePressed) {
    fill(0,255,0);
  } else {
    fill(255,0,0);
  }*/
  
  fill (0, 0, 255);
  
  if (mousePressed) {
    fill(0, 255, 0);
  } else {
    fill (255, 0, 0);
  }
  
  int diameter;
  //int diameter = 120;
  
  
  diameter = 120;
  
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
  
  ellipse(width/2, height/2, diameter, diameter);
  
  
}
