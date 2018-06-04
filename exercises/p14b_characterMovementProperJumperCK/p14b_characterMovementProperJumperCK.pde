
// ixd308s18 | week #2: in-class exercise
// author: ceren kayalar
// character movement left, right, jump 

PVector ballPos;
PVector ballSpeed;
PVector ballDim;


boolean isJumping = false;
boolean isMovingLeft = false;
boolean isMovingRight = false;

void setup() {

  size(640, 480);
  ballDim = new PVector(50, 50);
  ballSpeed = new PVector(0, 0);
  ballPos = new PVector(100, height - ballDim.y/2);

}

void draw() {
  background(200);
  updateBallMovement();
  displayBall(); 
}

void displayBall() {  
  fill(120);
  ellipse(ballPos.x, ballPos.y, ballDim.x, ballDim.y);
}

void updateBallMovement() {
    
  ballPos.x += ballSpeed.x;
  ballPos.y += ballSpeed.y;

  if (ballPos.y > height - ballDim.y/2) {
    ballSpeed.x = 0;
    ballSpeed.y = 0;
    
    ballPos.y = height - ballDim.y/2;   
  } else {
    ballSpeed.x += 0;
    ballSpeed.y += 0.32;
  }
  
  if (isJumping)
    if (ballSpeed.y == 0) // single jump, comment this line to jump also in the air
        ballSpeed.y = -10;
  
  if (isMovingLeft)
    ballSpeed.x = -2;
    
  if (isMovingRight)
    ballSpeed.x = 2;
}


void keyPressed () {
  switch(key)
  {
    case 'w': isJumping = true;
    break; 
    case 'a': isMovingLeft = true;
    break;
    case 'd': isMovingRight = true;
    break;   
  }
}

void keyReleased() {
  switch(key)
  {
    case 'w': isJumping = false;
    break;
    case 'a': isMovingLeft = false;
    break;
    case 'd': isMovingRight = false;
    break;   
  }
}