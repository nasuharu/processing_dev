PImage[] p;
int scene;

void setup(){
  size(600,600);
  p = new PImage[3];
  p[0] = loadImage("DSC_0102.JPG");
  p[1] = loadImage("DSC_0134.JPG");
  p[2] = loadImage("DSC_0257.JPG");
  scene = 0;
}

void draw(){
  background(255,255,255);
  rect(10,10,50,50);
  
  image( p[scene],60,60,600,600);
}

void mouseClicked(){
  if(mouseButton == LEFT){
    if(mouseX > 10 && mouseX < 50 && mouseY > 10 && mouseY < 50){
      scene = scene + 1;
      if(scene > 2){scene = 0;}
    }
  }
}