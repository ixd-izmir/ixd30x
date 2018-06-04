
/*

* ixd307f17 | week12: in-class exercise
* modified and corrected version of Ayda Ekin Mete's HW9 submission

You should make 4 balls with different colors, starting from 4 corners of the screen traveling
through the center with different speeds. When you click and hold the mouse button, the
balls should freeze. And when you let go of the mouse, the balls could go back to their initial
position and keep moving.

*/

float oneX = 0;
float oneY = 0;

float twoX = 700;
float twoY = 0;

float threeX = 0;
float threeY = 700;

float fourX = 700;
float fourY = 700;

float twoSpeed = 1.5;

void setup() { 
  size(700, 700); 
  ellipseMode(RADIUS);
  smooth();
  noStroke();
}

void draw() {
  background(250);
  fill(#E85959);
  ellipse(oneX,oneY,20,20);

  fill(#46E8D9);
  ellipse(twoX,twoY,20,20);

  fill(#F9FA44);
  ellipse(threeX,threeY,30,30);

  fill(#46E8D9);
  ellipse(fourX,fourY,30,30);
  
  /*-----alternative one --*/
  if (!mousePressed) {
    oneX += 5.9;
    oneY += 5.9;
    twoX -= twoSpeed;
    twoY += twoSpeed; // thıs ıs the same as twoY = twoY+twoSpeed;
    threeX += 2.3;
    threeY -= 2.3;
    fourX -= 5.8;
    fourY -= 5.8;
  }
  
  if(oneX>width) oneX = 0;
  if(oneY>height) oneY = 0;
  
  if(twoX<0) twoX = width;
  if(twoY>height) twoY = 0;
  
  if(threeX>width) threeX = 0;
  if(threeY<0) threeY = height;
  
    if(fourX<0) fourX = width;
  if(fourY<0) fourY = height;
  /*-----alternative two --
  if (mousePressed) {
    oneX -= 1.9;
    oneY -= 1.9;

    twoX += twoSpeed;
    twoY -= twoSpeed; // thıs ıs the same as twoY = twoY+twoSpeed;

    threeX -= 2.3;
    threeY += 2.3;

    fourX += 2.8;
    fourY += 2.8;
  }*/
}

void mouseReleased(){
 oneX=   0;
 oneY = 0;

 twoX =  700;
 twoY =  0;

 threeX = 0;
 threeY = 700;

 fourX = 700;
 fourY = 700;
} 