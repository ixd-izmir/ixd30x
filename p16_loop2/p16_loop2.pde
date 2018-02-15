/*

  ixd308s18 | week #3: in-class exercise
  introduction to loops: for
  authors    : Ceren Kayalar and Daniele Savasta
  exercise #2: draws vertical lines with constant spacing 
  
*/

size(400, 300);

background(0);
strokeWeight(2);
stroke(255);

for (int i = 0; i <= width; i +=20) {
  line(i, 0, i, height);
  println(i);
}