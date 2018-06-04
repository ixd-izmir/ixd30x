
// ixd307f17 
// display the time since the beginning of the sketch's runtime and a counter to zero from 10 seconds 
// author: Ceren Kayalar

int gameDuration = 10;
int pcurrentTime = -1, premainingTime = 11; 
// remember the pmouseX and pmouseY variables of Processing?
// pmouseX: previous mouse X position from last call of draw()) 
// pmouseY (previous mouse X position from last call of draw()) 
// now we are defining our own "previous currentTime" and "previous remainingTime" variables to track time
  
void setup() {
}


void draw() {
  int currentTime = millis()/1000;
  
  if (pcurrentTime < currentTime) {
    print("Current time: ", currentTime);
    pcurrentTime = currentTime;
  }
  
  int remainingTime = gameDuration - currentTime;
 
  if (premainingTime > remainingTime) {
    if (remainingTime > 0) {
      println(" Time left: ", remainingTime);
      premainingTime = remainingTime;
    } else 
      println(" GAME OVER");
  }
}