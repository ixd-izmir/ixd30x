// don't forget that a new tab creates a new pde file in your sketch folder 
// https://processing.org/reference/environment/#Tabs

void displayCharacters() {
  
  pushMatrix();
  if (lookingLeft) {
    translate(posx, posy);
    image(heroI, 0, 0);
  } else {
    translate(posx, posy);
    scale(-1, 1);
    image(heroI, 0, 0);
  }
  popMatrix();
  
  ellipse(100, 100, 30, 30);
  
  //image(heroI,posx,posy,w,h);
  //shape(heroS,posx,posy);
  //ellipse(posx,posy,w,h);
  
}

void moveHero() {
  
  if(posx<tarx) {
    posx+=speed;
  }
  if(posx>tarx) {
    posx-=speed;
  }
  
  if(posy<height-h/2) 
    posy+=gravity;
    
  //println("posy= ", posy);
  
  // 06.02.2018: jump conditions to be fixed
  if(jumping) {
    posy += (tary-posy)*speed;
  }
  if(posy<=jump) jumping=false;
  
}