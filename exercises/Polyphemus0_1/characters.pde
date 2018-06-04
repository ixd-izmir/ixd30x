void displayCharacters() {
  pushMatrix();
  if (lookingLeft) {
    translate(posx, posy-h*.5);
    image(heroI, 0, 0);
  } else {
    translate(posx, posy-h*.5);
    scale(-1, 1);
    image(heroI, 0, 0);
  }
  popMatrix();
}

void moveHero() {
  //Moving horizontally if out targeted position is further left/right
  posx+=xvel; 
  posy+=yvel;
  
  if (isLeft)  xvel-=powx;
  if (isRight) xvel+=powx;

  yvel*=frict;
  xvel*=frict;
  yvel+=gravity;

  //If the character is touching theloor it should stop falling
  posy=groundCollision(posx,posy);
  
  if((isUp)&&(jumping<0)){
    yvel-=powy;
    jumpS.trigger();
    jumping=60;
  }
  jumping--;
  
  /*if(pposx!=posx) {
    bgx+=pposx-posx;
    pposx=posx;
  }*/
}

float groundCollision(float px,float py){
  boolean hit = polyPoint(shapeGround, px,py);
  float f=0.25;
  while(hit) {
    py-=f;
    hit = polyPoint(shapeGround, px,py);
    yvel=0;
  }
  return py;
}

void showGround(){
  shape(sG,0,0);
}

void groundSetup(){
  shapeGround[0] = new PVector(0,916);
  shapeGround[1] = new PVector(1914,835);
  shapeGround[2] = new PVector(1914,1080);
  shapeGround[3] = new PVector(0,1080);
  if(showingGround) {
  
  sG = createShape();
  sG.beginShape();
  for(int i=0;i<shapeGround.length;i++)
    sG.vertex(shapeGround[i].x,shapeGround[i].y);
  sG.endShape(CLOSE); 
  sG.setFill(color(255,128,0,128));
  }
}