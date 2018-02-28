/*

 * ixd308s18 | week #2: in-class exercise
 
 author             : daniele savasta
 comments and edits : ceren kayalar
 
 code sample demonstrating character movement using keyboard (jump still problematic)
 introduction to game states and functions to make the code modular
 
 */
boolean isLeft, isRight, isUp, isDown; 

float posx, posy;
float powx=0.5;
int gtol=50;
float powy=20;
float ymax=-10;
float xvel=0;
float yvel=0;        
float frict = 0.97;             //friction
float vel = 0.6;                //velocity
float h=223;                    //height of the character
float w=136;                    //width of the character
float gravity=0.78;
float ground;
PImage heroI;                  //image
boolean grounded=true;
boolean lookingLeft = true;    //to flip the character position
PImage bg;
float bg0;
int gameScreen = 0;            //stage
boolean showingGround=true;

PVector[] shapeGround = new PVector[4];
PShape sG;
float bgx;
float pposx;

void setup() {
  size(1920, 1080);
  frameRate(60);
  posx=width/2;
  bgx=-posx;
  pposx=posx;
  ground=height-h/2;
  posy=100;
  heroI=loadImage("char2.png");
  bg=loadImage("bg.png");
  minimSetup();
  bg0=bg.width*.5;
  
  groundSetup();
}

void draw() {
  switch (gameScreen) {
  case 0: 
    displayMainMenu(); 
    break;

  case 1: 
    displayGame();
    if (showingGround) showGround();
    break;

  case 2: 
    displayGameOver(); 
    break;

  case 3: 
    displayGameOver();
    println("GAME OVER");
    break;
  }
  showMouseCoor();
}

void displayMainMenu() {
  background(255);
  textAlign(CENTER);
  fill(100, 0, 0);
  text("MAIN MENU", width/2, height/2);
}

void displayGame() {
  //background(255);
 // pushMatrix();
  //  translate(posx,0);
    image(bg,int((posx-width/2)+bg0),int(height/2));
 // popMatrix();
  println(frameRate);
  imageMode(CENTER);
  displayCharacters();
  moveHero();
}

void displayGameOver() {
  background(255);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
}

void keyPressed() {
  setMove(key, true);
  if (key == ENTER) {
    if (gameScreen == 0)
      gameScreen = 1;
    else if (gameScreen == 1)
      gameScreen = 2;
  }
}

void keyReleased() {
  setMove(key, false);
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case 'w':
    return isUp = b;

  case 's':
    return isDown = b;

  case 'a':
    lookingLeft = true;
    return isLeft = b;

  case 'd':
    lookingLeft = false;
    return isRight = b;

  default:
    return b;
  }
}