
/* 

   ixd308s18 | week #5
   author: Ceren Kayalar
   (27/02/2018) loading and displaying spritesheets for different characters or actions
   
*/

int LUNA_SS_NUM_OF_ROWS = 4;
int LUNA_SS_NUM_OF_COLS = 5;

int SQUIRREL_SS_NUM_OF_ROWS = 5;
int SQUIRREL_SS_NUM_OF_COLS = 3; 

PImage[] lunaSprites, squirrelSprites;
int lunaSpritesCurrentIndex, squirrelSpritesCurrentIndex;
PImage lunaSpritesheetImg, squirrelSpritesheetImg;

boolean rightArrowPressed;
PVector lunaPosition, squirrelPosition;

PImage[] loadSprites(String imgName, PImage spritesheetImg, PImage[] sprites, int row, int col) {
  
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
  size(1200, 400);
  frameRate(35);
 
  imageMode(CENTER);
  rightArrowPressed = false;
  lunaPosition = new PVector(10, 200);
  squirrelPosition = new PVector(30, 200);
  lunaSpritesCurrentIndex = squirrelSpritesCurrentIndex = 0;
  
  lunaSprites = loadSprites("luna.png", lunaSpritesheetImg, lunaSprites, LUNA_SS_NUM_OF_ROWS, LUNA_SS_NUM_OF_COLS);
  squirrelSprites = loadSprites("squirrel.png", squirrelSpritesheetImg, squirrelSprites, SQUIRREL_SS_NUM_OF_ROWS, SQUIRREL_SS_NUM_OF_COLS);
 
}


void draw(){
  background(255);
 
  image(lunaSprites[lunaSpritesCurrentIndex%lunaSprites.length], lunaPosition.x++, lunaPosition.y);
  lunaSpritesCurrentIndex++; // we choose to animate luna in every draw call
  
  if (rightArrowPressed) {
    image(squirrelSprites[squirrelSpritesCurrentIndex%squirrelSprites.length], squirrelPosition.x++, squirrelPosition.y);
    squirrelPosition.x += 1;
    squirrelSpritesCurrentIndex++; // squirrel is animated only if the right arrow is pressed
  } else {
    squirrelSpritesCurrentIndex = 0;
    // if the no direction given to the character, display its default image
    image(squirrelSprites[0], squirrelPosition.x, squirrelPosition.y);
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    rightArrowPressed = true;
    }
}

void keyReleased() {
  if (key == CODED && keyCode == RIGHT) {
    rightArrowPressed = false;
  }
}