PImage img;
String stage;

int posx[] ={111,410,708,1010};
int posy[] ={432,466,500};

int l=10,  //low level
    m=140, //med level
    h=165, //max level
    d=82;  //default level

void setup() {
  size(1200, 600);
  img = loadImage("background.png");
}

void draw() {
  image(img, 0, 0);
  
  if (mouseX > 0 && mouseX < 300) stage="young";
  else if (mouseX > 300 && mouseX < 600) stage="adult";
  else if (mouseX > 600 && mouseX < 900) stage="old";
  else stage="designer";
  
  if(stage=="young")    displayCustom(posx[0],m,l,h); else displayDefault(posx[0]);
  if(stage=="adult")    displayCustom(posx[1],l,h,m); else displayDefault(posx[1]);
  if(stage=="old")      displayCustom(posx[2],l,l,l); else displayDefault(posx[2]);
  if(stage=="designer") displayCustom(posx[3],h,m,l); else displayDefault(posx[3]);
}

void drawABar(int posx, int posy, int value) {
  fill(#ff0000);
  rect(posx, posy, value, 18);
}

void displayDefault(int posx){
  displayCustom(posx,d,d,d);
}

void displayCustom(int posx,int value1,int value2,int value3){
    drawABar(posx, posy[0], value1);
    drawABar(posx, posy[1], value2);
    drawABar(posx, posy[2], value3);
}