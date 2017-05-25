float x = 33.0;
float y = 5.0;
float radius = 30.0,velocity = 0.0,friction = 0.99,acceleration = 0.3,d = 1;

void setup(){
  frameRate(60);
  size(500,500);
  noStroke();
  ellipseMode(RADIUS);
}

void draw(){ //60fps
  fill(0,12);
  rect(0,0,width,height);
  fill(255);
  
  x +=d;
  velocity +=acceleration;
  velocity *= friction;
  y +=velocity;
  
  if (x>width-radius || x<radius){
    d = (-1)+d;
  }
  if (y > (height-radius)){
    y = height - radius;
    velocity = -velocity;
  }
  
  ellipse(x,y,radius,radius);
}