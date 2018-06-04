
// ixd308s18 | week #2: in-class
// submission of Elif Melisa Boz
// edited by Ceren Kayalar in-class
// added functions, constants, slightly modular version

PImage img;

int YOUNG_XPOS = 111; // constant definition can be defined uppercase for readability
int ADULT_XPOS = 410;
int OLD_XPOS = 708;
int DESIGNER_XPOS = 1010;


void setup(){
size(1200,600);
img = loadImage("background.png");
}

void displayDefaultBarChart(int xPos) {
  fill(#ff0000);
  rect(xPos, 432, 82, 18);
  fill(#ff0000);
  rect(xPos, 466, 82, 18);
  fill(#ff0000);
  rect(xPos, 500, 82, 18);
}

void displayBarChart(String str) {
  switch (str) {
    case "young": 
     // changed young
      fill(#ff0000);
      rect(YOUNG_XPOS, 432, 140, 18);
      fill(#ff0000);
      rect(YOUNG_XPOS, 466, 10, 18);
      fill(#ff0000);
      rect(YOUNG_XPOS, 500, 165, 18);
      //adult
      displayDefaultBarChart(ADULT_XPOS);
      //old
      displayDefaultBarChart(OLD_XPOS);
      //designer
      displayDefaultBarChart(DESIGNER_XPOS);
    break;
    
    case "adult":
      //young
      displayDefaultBarChart(YOUNG_XPOS);
      // changed adult
      fill(#ff0000);
      rect(ADULT_XPOS, 432, 10, 18);
      fill(#ff0000);
      rect(ADULT_XPOS, 466, 165, 18);
      fill(#ff0000);
      rect(ADULT_XPOS, 500, 140, 18);
      //old
      displayDefaultBarChart(OLD_XPOS);     
      //designer
      displayDefaultBarChart(DESIGNER_XPOS);
    break;
    
    case "old":
      //young
      displayDefaultBarChart(YOUNG_XPOS);
      // adult
      displayDefaultBarChart(ADULT_XPOS);   
      //changed old
      fill(#ff0000);
      rect(OLD_XPOS, 432, 165, 18);
      fill(#ff0000);
      rect(OLD_XPOS, 466, 140, 18);
      fill(#ff0000);
      rect(OLD_XPOS, 500, 10, 18);     
      //designer
      displayDefaultBarChart(DESIGNER_XPOS);
    break;
    
    case "designer":
     //young
      displayDefaultBarChart(YOUNG_XPOS);
      // adult
      displayDefaultBarChart(ADULT_XPOS);
      //old
      displayDefaultBarChart(OLD_XPOS);   
      //changed designer
      fill(#ff0000);
      rect(DESIGNER_XPOS, 432, 10, 18);
      fill(#ff0000);
      rect(DESIGNER_XPOS, 466, 10, 18);
      fill(#ff0000);
      rect(DESIGNER_XPOS, 500, 10, 18);
    break;
    
    default:
     //young
      displayDefaultBarChart(YOUNG_XPOS);
      // adult
      displayDefaultBarChart(ADULT_XPOS);      
      //old
      displayDefaultBarChart(OLD_XPOS);
       //designer
      displayDefaultBarChart(DESIGNER_XPOS);
  }
}

void draw(){
  image(img, 0, 0);
  fill(#d1a832);
  rect(YOUNG_XPOS, 432, 165, 18);
  fill(#d1a832);
  rect(YOUNG_XPOS, 466, 165, 18);
  fill(#d1a832);
  rect(YOUNG_XPOS, 500, 165, 18);
  
  // Orange 
  if (mouseX > 0 && mouseX < 300) {  
     displayBarChart("young");
     println("y");
  }
  // Blue 
  else if(mouseX > 300 && mouseX < 600){
    displayBarChart("adult");
    println("a");
  }
  // Green 
  else if(mouseX > 600 && mouseX < 900){
    displayBarChart("old");
    println("o");
  }
  // Purple 
  else if(mouseX > 900 && mouseX < 1200){
    displayBarChart("designer");
    println("d");
  } else {
    displayBarChart("default");
    println("x");
  }
}