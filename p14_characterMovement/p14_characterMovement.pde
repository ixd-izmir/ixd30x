/*

* ixd308s18 | week #2: in-class exercise

author             : daniele savasta
comments and edits : ceren kayalar

code sample demonstrating character movement using keyboard (jump still problematic)
introduction to game states and functions to make the code modular

*/

float posx,posy;
float tarx,tary;
float step=10;
float jump=100;
float speed=5;
float speedJump=.25;
float h=223;
float w=136;
float gravity=9;
float ground;
boolean jumping=false;
PImage heroI;
PShape heroS;
boolean lookingLeft = true;

int gameScreen = 0;

void setup(){
  size(800,600);
  //posy=height-h/2;
  posy=height/2 - 100;
  posx=width/2;
  tarx=posx;
  ground=height-h/2;
  tary=ground;
  jump=300;
  heroI=loadImage("char1.png");
  heroS=loadShape("char1.svg");
}

void draw(){
  
  switch (gameScreen) {
    
    case 0: displayMainMenu(); 
    break;
    
    case 1: displayGame();
    break;
    
    case 2: displayGameOver(); 
    break;
    
    case 3: displayGameOver();
            println("GAME OVER");
    break;
    
  }
  
  // switch-case can be implemented using if-else statements:
  /*  
  if (gameScreen == 0) {
   displayMainMenu();    
  } else if (gameScreen == 1) {  
   displayGame();
  } else if (gameScreen == 2) {  
   displayGameOver();  
  }*/
 
 
}

void displayMainMenu() {
    background(255);
    textAlign(CENTER);
    fill(100, 0, 0);
    text("MAIN MENU", width/2, height/2);
}

void displayGame() {
   background(255);
   imageMode(CENTER);
 
   displayCharacters();
   moveHero();
}

void displayGameOver() {
  
    background(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
}

void keyPressed(){
  if(key=='w') {
    jumping=true;
  }
  if(key=='a') {
    tarx-=step;
    lookingLeft = true;
  }
  if(key=='d') {
    tarx+=step;
    lookingLeft = false;
  }
  
  if (key == ENTER) {
    if (gameScreen == 0)
      gameScreen = 1;
    else if (gameScreen == 1)
      gameScreen = 2;
  }
}

void mousePressed() {
  gameScreen = 3;
}