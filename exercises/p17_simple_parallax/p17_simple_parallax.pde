
/*
* A really (REALLY!) simple implementation of a parallax effect.
* Coded by: Rodrigo Amaya, follow me @ramayac

* Edit: CK (15/02/18) with some background from opengameart
           (20/02/18) character movement using keys
*/

PImage bkg1, bkg2, bkg3, bkg4, bkg5;
PVector v1, v2, v3, v4, v5;
float bkg1_positionX, bkg1_positionY;

PImage spritesheet;
int DIM = 4;
int ROW = 5;
int COL = 10;
PImage[] sprites;

boolean isSecondHeroWalking = false;

int heroX, heroY, secondHeroX, secondHeroY;
int hero_currentFrame, secondHero_currentFrame;

void setup(){
  size(800, 600);
  frameRate(25);
  textSize(10);

  
  heroX = secondHeroX = 10;
  heroY = secondHeroY = 420;
  
  hero_currentFrame = secondHero_currentFrame = 0;
 
  loadSprite("normal_walk.png", DIM, DIM);
  
  bkg1= loadImage("1/layer_01.png");
  bkg2= loadImage("1/layer_02.png");
  bkg3= loadImage("1/layer_03.png");
  bkg4= loadImage("1/layer_04.png");
  bkg5= loadImage("1/layer_05.png");
  
  bkg1.resize(0,600);
  bkg2.resize(0,600); 
  bkg3.resize(0,600);
  bkg4.resize(0,600);
  bkg5.resize(0,600);

  v1= new PVector(0, 0);
  bkg1_positionX = 0;
  bkg1_positionY = 0;
  
  v2= new PVector(0, 0);
  v3= new PVector(0, 0);
  v4= new PVector(0, 0);
  v5= new PVector(0, 0);
}

void paraDraw(PImage img, float positionX, float positionY, float speed) {
  positionX -= speed;
  
  int r = (int)positionX+img.width;

  if(r < width) image(img, r, positionY);
  if(positionX < width) image(img, positionX-img.width, positionY);  
  if(positionX < -img.width) positionX = width;

  image(img, positionX, positionY);
  
}

void paraDraw(PImage img, PVector position, float speed){
  
  position.sub(speed, 0, 0);
  
  int r = (int)position.x+img.width;

  if(r < width) image(img, r, position.y);
  if(position.x < width) image(img, position.x-img.width, position.y);  
  if(position.x < -img.width) position.x = width;

  image(img, position.x, position.y);
}

void draw(){
  background(255);
  paraDraw(bkg1, v1, 1); // stars
  // void paraDraw(PImage img, PVector position, float speed)
  
  // void paraDraw(PImage img, float positionX, float positionY, float speed)
  paraDraw(bkg1, bkg1_positionX, bkg1_positionY, 1);
  paraDraw(bkg2, v2, 2); // clouds
  paraDraw(bkg3, v3, 3); // mountains
  paraDraw(bkg4, v4, 4); // trees
  paraDraw(bkg5, v5, 5); // ground

  noFill();
  rect(heroX, heroY, sprites[hero_currentFrame%sprites.length].width, sprites[hero_currentFrame%sprites.length].height);
  //First hero is the running one
  image(sprites[hero_currentFrame%sprites.length], heroX++, heroY);
  hero_currentFrame++;
  
  fill(0);
  text("w/frameCount", secondHeroX, secondHeroY-200);
  text("w/currentFrame variable", secondHeroX, secondHeroY);
  
  if (isSecondHeroWalking) {
    image(sprites[frameCount%sprites.length], secondHeroX, secondHeroY-200);
    println(frameCount%sprites.length , secondHero_currentFrame%sprites.length);
    image(sprites[secondHero_currentFrame%sprites.length], secondHeroX, secondHeroY);
    secondHero_currentFrame++;
    secondHeroX += 1;
  } else {
    // if using frameCount, we use the first frame of the spitesheet to display stationary frame
    image(sprites[0], secondHeroX, secondHeroY-200); 
    image(sprites[secondHero_currentFrame%sprites.length], secondHeroX, secondHeroY);
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    isSecondHeroWalking = true;
  }
}

void keyReleased() {
  if (key == CODED && keyCode == RIGHT) {
    isSecondHeroWalking = false;
  }
}


 