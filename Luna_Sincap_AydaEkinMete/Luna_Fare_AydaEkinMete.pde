
int LUNA_SS_NUM_OF_ROWS = 4;
int LUNA_SS_NUM_OF_COLS = 5;

int SINCAP_SS_NUM_OF_ROWS = 5;
int SINCAP_SS_NUM_OF_COLS = 3;

PImage[] spritesLuna, spritesSincap;
PImage imgLunaSpritesheet, imgSincapSpritesheet;

boolean isSecondHeroWalking = false;

int heroX, secondHeroX;

PImage[] loadSprite(String imgName, PImage spritesheetImg, PImage[] sprites, int row, int col) {
  
  spritesheetImg = loadImage(imgName);
  sprites = new PImage[row*col]; 
  
  int W = spritesheetImg.width/col;
  int H = spritesheetImg.height/row;
 
  println("SPRITESHEET: ", spritesheetImg.width, spritesheetImg.height);
  println("SINGLE FRAME: ", W, H);
  
  for (int i=0; i<sprites.length; i++) {
   
    int x = i%col*W;
    int y = i/col*H;
    
    println("OFFSET: ",x, y);
    sprites[i] = spritesheetImg.get(x, y, W, H);

  }
  
  return sprites;
}


void setup(){
  size(1200, 600);
  frameRate(35);
 
  spritesLuna = loadSprite("luna.png", imgLunaSpritesheet, spritesLuna, LUNA_SS_NUM_OF_ROWS, LUNA_SS_NUM_OF_COLS);
  spritesSincap = loadSprite("sincap.png", imgSincapSpritesheet, spritesSincap, SINCAP_SS_NUM_OF_ROWS, SINCAP_SS_NUM_OF_COLS);
 
 

}


void draw(){
  background(255);
  noFill();
 
  // rect(heroX, 220, sprites[frameCount%sprites.length].width, sprites[frameCount%sprites.length].height);
  //first hero is the running one 
  image(spritesLuna[frameCount%spritesLuna.length], heroX++, 220);
  
  if (isSecondHeroWalking) {
    image(spritesSincap[frameCount%spritesSincap.length], secondHeroX, 100);
    secondHeroX += 1;
  } else
    image(spritesSincap[0], secondHeroX, 100);
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




 

 