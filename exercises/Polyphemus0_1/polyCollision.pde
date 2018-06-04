boolean polyPoint(PVector[] vertices, float px, float py) {
  boolean collision = false;
  
  // go through each of the vertices, plus the next vertex in the list
  int next = 0;
  for (int current=0; current<vertices.length; current++) {
    
    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;
    
    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = vertices[current];    // c for "current"
    PVector vn = vertices[next];       // n for "next"
    
    // compare position, flip 'collision' variable back and forth
    if ( ((vc.y >= py && vn.y < py) || (vc.y <= py && vn.y > py)) &&
         (px < (vn.x-vc.x) * (py-vc.y) / (vn.y-vc.y) + vc.x) ) {
            collision = !collision;
    }
  }
  return collision;  
}

void showMouseCoor(){
 noCursor();
 fill(0,128,255);
 stroke(0,128,255);
 line(mouseX-2.5,mouseY,mouseX+2.5,mouseY);
 line(mouseX,mouseY-2.5,mouseX,mouseY+2.5);
 textSize(22);
 text(mouseX+":"+mouseY,mouseX,mouseY-5);
}