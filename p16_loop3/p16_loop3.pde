/*

  ixd308s18 | week #3: in-class exercise
  introduction to loops: for
  authors    : Ceren Kayalar and Daniele Savasta
  exercise #3: draws lines so that one end is connected to the mouse position and 
               one end is connected to left/right edges of the canvas  
*/

void setup() {
  size(800,600);
  stroke(0, 120, 0);
}

void draw() {
  background(255);

  // draw vertical lines to the background
  for(int i=0;  i<=width;  i+=50) {
    line(i,0,i,height);    
  }

  // draw the lines on the right handside of the mouse position using for loop
  for(int i=0;  i<=height;  i+=20) {
     stroke(i/255, 120, i%255);
     line(mouseX,mouseY,width,i);    
  }
  
  
  
  int i = 0; // initialization
  // draw the lines on the left handside of the mouse position using while loop
  while (i < height) { // test
    stroke(i/255, i/255, i%255);
    line(mouseX,mouseY,0,i);    //second v line
    i+=20;
  }
  
  /* 
  // same output using for loop  
  for(int i=0;  i<height;  i+=20) {
      line(mouseX,mouseY,0,i);    //second v line
  }*/
  
  /* 
  // CAUTION: if the test statement of a loop is always true, it will block your 
  // sketch's draw loop and freeze the sketch forever.
  while(i > 0) { // while(true)
    println("loop forever");
  } */
  
}