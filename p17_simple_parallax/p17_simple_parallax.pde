
/*
* A really (REALLY!) simple implementation of a parallax effect.
* Coded by: Rodrigo Amaya, follow me @ramayac

* Edit: CK (15/02/18) with some background from opengameart
           (20/02/18) character movement using keys
*/

PImage back, middle, front;
PVector vback, vmiddle, vfront;

PImage bkg1, bkg2, bkg3, bkg4, bkg5, bkg6, bkg7;
PVector v1, v2, v3, v4, v5, v6, v7;

PImage spritesheet;
int DIM = 4;
int ROW = 5;
int COL = 10;
PImage[] sprites;

boolean walkSecond = false;

int heroX, secondHeroX;

void loadSprite(String imgName, int row, int col) {
  
  spritesheet = loadImage(imgName);
  sprites = new PImage[row*col];
 
  //int W = spritesheet.width/DIM;
  //int H = spritesheet.height/DIM;
  
  int W = spritesheet.width/col;
  int H = spritesheet.height/row;
  
  println("SPRITESHEET: ", spritesheet.width, spritesheet.height);
  println("SINGLE FRAME: ", W, H);
  for (int i=0; i<sprites.length; i++) {
    //int x = i%DIM*W; // '%' modulus
    //int y = i/DIM*H; // '/' division
    
    int x = i%col*W;
    int y = i/row*H;
    
    println("OFFSET: ",x, y);
    sprites[i] = spritesheet.get(x, y, W, H);
  }
}

void setup(){
  
  heroX = secondHeroX = 10;
 
  loadSprite("normal_walk.png", DIM, DIM);
  //loadSprite("Jack_Walking.png", ROW, COL);
  
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
  
 /* bkg1= loadImage("2/layer_01.png");
  bkg2= loadImage("2/layer_02.png");
  bkg3= loadImage("2/layer_03.png");
  bkg4= loadImage("2/layer_04.png");
  bkg5= loadImage("2/layer_05.png");
  bkg6= loadImage("2/layer_06.png");
  bkg7= loadImage("2/layer_07.png");*/
  
  
  size(800, 600);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  
  v1= new PVector(0, 0);
  v2= new PVector(0, 0);
  v3= new PVector(0, 0);
  v4= new PVector(0, 0);
  v5= new PVector(0, 0);
  v6= new PVector(0, 0);
  v7= new PVector(0, 0);

  frameRate(25);

}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  
  image(img, pos.x, pos.y);
  //fill(#ff0000);
  //rect(pos.x, 0, img.width, img.height);
}

void draw(){
  background(255);
  paraDraw(bkg1, v1, 1); // stars
  paraDraw(bkg2, v2, 2); // clouds
  paraDraw(bkg3, v3, 3); // mountains
  paraDraw(bkg4, v4, 4); // trees
  paraDraw(bkg5, v5, 5); // ground
 // paraDraw(bkg6, v6, 6);
 // paraDraw(bkg7, v7, 7);
  
  noFill();
  rect(heroX, 220, sprites[frameCount%sprites.length].width, sprites[frameCount%sprites.length].height);
  image(sprites[frameCount%sprites.length], heroX++, 220);
  
  if (walkSecond) {
    image(sprites[frameCount%sprites.length], secondHeroX, 220);
    secondHeroX += 10;
  } else
    image(sprites[0], secondHeroX, 220);
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    walkSecond = true;
  }
}

void keyReleased() {
  if (key == CODED && keyCode == RIGHT) {
    walkSecond = false;
  }
}


 