
/*

  ixd308s18 | week #3: in-class exercise
  introduction to loops: for 
  authors    : Ceren Kayalar and Daniele Savasta
  exercise #1: fill the canvas with equally spaced vertical and horizontal lines (create a grid) -
              change the parameter sequence used in the line() function to reach different effects
              
*/

size(1280,600);

/* option #1: Drawing without a for loop

line(0, 0, 0, 600);
line(50, 0, 50, 600);
line(100, 0, 100, 600);
line(150, 0, 150, 600);
line(200, 0, 200, 600);
line(250, 0, 250, 600);
line(300, 0, 300, 600);
line(350, 0, 350, 600);
line(400, 0, 400, 600);
line(450, 0, 450, 600);
line(500, 0, 500, 600);
line(550, 0, 550, 600);
line(600, 0, 600, 600);
line(650, 0, 650, 600);
line(700, 0, 700, 600);
line(750, 0, 750, 600);
line(800, 0, 800, 600);
line(850, 0, 850, 600);
line(900, 0, 900, 600);
line(950, 0, 950, 600);
line(1000, 0, 1000, 600);
line(1050, 0, 1050, 600);
line(1100, 0, 1100, 600);
line(1150, 0, 1150, 600);
line(1200, 0, 1200, 600);
line(1250, 0, 1250, 600);

*/

/* option #2: Introducing a variable to see the repetition

int x=0;
stroke(255, 0, 0);
line(x,0,x,height);    //first v line
x+=50; // x=x+50;
line(x,0,x,height);    //second v line
x+=50; // x=x+50;
line(x,0,x,height);    //third v line
x+=50; // x=x+50;
line(x,0,x,height);    //fourth v line

// so on...
*/

stroke(0, 120, 0);
for(int i=0;  i<width;  i+=50) {
    line(i,0,i,height);  
   // println(i+","+0+","+i+","+height); //uncomment to see the values on console
}

for(int i=0;  i<height;  i+=20) {
    line(i,0,width,i);    
}
    