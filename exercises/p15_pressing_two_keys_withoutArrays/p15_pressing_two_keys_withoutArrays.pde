
boolean keyLeft, keyRight;


void setup()
{
  size(200, 200);
  frameRate(10);
  
  keyLeft=false;
  keyRight=false;
}
void draw() 
{
  if( keyLeft) 
  {  
    print("LEFT ");
  }
  if( keyRight) 
  {
    print("RIGHT ");
  }
  
  print("\n");
}

void keyPressed()
{
  if(key=='a')
    keyLeft=true;
  if(key=='s')
    keyRight=true;
}

void keyReleased()
{
  if(key=='a')
    keyLeft=false;
  if(key=='s')
    keyRight=false;
} 