/*
ixd308s18 | week#2:
HW_3
Merve Simsek

edited by Ceren Kayalar in-class: started adding highlights 
for interactive areas, code not complete yet

*/

PImage bas;
PImage stars;
PImage star1;
PImage star2;
PImage star3;


int roomscreen=0;

void setup() {
  size(500, 600);
  bas= loadImage("bas.jpg");
  stars = loadImage("starstars.jpg");
  star1 = loadImage("star1.jpg");
  star2 = loadImage("star2.jpg");
  star3 = loadImage("star3.jpg");
}

void draw() {
  
  switch (roomscreen) {
    case 0 :
    displaybas();
    if (mouseX>width-400) { 
      fill(100, 100, 100, 100);
      rect(width-400, 0, width, height);
    }
    break;
    
    case 1 :
    displaystars();
    if (mouseX<width-350) { 
      fill(100, 100, 100, 100);
      rect(0, 0, width-350, height);
    }
    
    if (mouseX>width-350) {
      fill(100, 100, 100, 100);
      rect(width-350, 0, width-150, height);
    }
    
    if (mouseX>width-400) {
      fill(100, 100, 100, 100);
      rect(width-400, 0, width, height);
    }
    
    break;
    
    case 2 :
    displaystar1();
    break;
    
    case 3 :
    displaystar2();
    break;
    
    case 4 :
    displaystar3();
    break;
  }
}

 void displaybas() {
   image(bas, 0, 0);
   fill(255);
   textSize(24);
 text("Start", width-280, height-272);
 }
 
 void displaystars() {
   image(stars, 0, 0);
   fill(0);
   textSize(24);
 }
 
 void displaystar1() {
   image(star1, 0, 0);
   fill(255);
   textSize(24);
   text("Back", width-90, height-550);
 }
 
 void displaystar2() {
   image(star2, 0, 0);
   fill(255);
   textSize(24);
   text("Back", width-90, height-550);
 }
 
 void displaystar3() {
   image(star3, 0, 0);
   fill(255);
   textSize(24);
   text("Back", width-90, height-550);
 }
 
 void mousePressed () {
   
   if (mousePressed){
    
     if(roomscreen== 0 && mouseX>width-400) 
       roomscreen=1;
 
    else if(roomscreen== 1 && mouseX<width-400)
     roomscreen=2;
     
    else if(roomscreen== 2 && mouseX>width-400)
     roomscreen=1;
    
    else if(roomscreen== 1 && mouseX>width-150)
     roomscreen=3;
     
    else if (roomscreen== 3 && mouseX>width-150)
     roomscreen=1;
     
    else if (roomscreen== 1 && mouseX>width-400)
     roomscreen=4;
     
     else if (roomscreen== 4 && mouseX>width-150)
     roomscreen=1;
}
}