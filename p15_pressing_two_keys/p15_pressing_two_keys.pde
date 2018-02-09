boolean[] keys;

void setup()
{
  size(200, 200);
  frameRate(5);
  keys=new boolean[2];
  keys[0]=false;
  keys[1]=false;
}
void draw() 
{
  if( keys[0]) 
  {  
    print("1");
  }
  if( keys[1]) 
  {
    print("2");
  }
}

void keyPressed()
{
  if(key=='a')
    keys[0]=true;
  if(key=='s')
    keys[1]=true;
}

void keyReleased()
{
  if(key=='a')
    keys[0]=false;
  if(key=='s')
    keys[1]=false;
} 