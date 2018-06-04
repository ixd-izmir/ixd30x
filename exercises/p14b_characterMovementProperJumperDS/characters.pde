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
}

void moveHero() {
  //Moving horizontally if out targeted position is further left/right
  posx+=xvel; 
  posy+=yvel;

  if (isLeft)  xvel-=powx;
  if (isRight) xvel+=powx;
  //if (isDown)yvel=yvel+frict;
  if ((isUp)&&(yvel>ymax)&&(grounded)) yvel-=powy;
  if(posy<ground-gtol) grounded=false;
  yvel*=frict;
  xvel*=frict;
  yvel+=gravity;

  //If the character is touching theloor it should stop falling
  if (posy > ground) {
    //yvel = 0;
    posy = ground;
    grounded=true;
  } 
}