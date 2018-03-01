import java.util.Date;

PGraphics spritesheet;

int ROW = 4;
int COL = 5;
int W,H;

void setup(){
  String path = sketchPath();

  println("Listing all filenames in a directory: ");
  String[] filenames = listFileNames(path+"/data");
  printArray(filenames);

  PImage[] images= new PImage[filenames.length];
  for (int i = 0; i < filenames.length; i++) {
    images[i]=loadImage(filenames[i]);
  }
  W=images[0].width;
  H=images[0].height;
  spritesheet = createGraphics(W*COL, H*ROW);
  spritesheet.beginDraw();
  for (int i = 0; i < filenames.length; i++) {
    int x = i%COL*W; // '%' modulus
    int y = i/COL*H; // '/' division
    
    spritesheet.image(images[i],x, y, W, H);
  }
  spritesheet.endDraw();
  
  spritesheet.save("spritesheet.png");
}

void draw(){

}