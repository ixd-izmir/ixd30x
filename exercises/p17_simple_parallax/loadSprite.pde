// This function is going to load one single image spritesheet into an array holder

void loadSprite(String imgName, int row, int col) {
  spritesheet = loadImage(imgName);
  sprites = new PImage[row*col];
 
  int W = spritesheet.width/col;
  int H = spritesheet.height/row;
  
  println("SPRITESHEET: ", spritesheet.width, spritesheet.height);
  println("SINGLE FRAME: ", W, H);
  for (int i=0; i<sprites.length; i++) {
    int x = i%col*W;
    int y = i/col*H;
    
//    println("OFFSET: ",x, y);
    sprites[i] = spritesheet.get(x, y, W, H);
  }
}