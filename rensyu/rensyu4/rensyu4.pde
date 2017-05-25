int z = 0;
int dz = 3;

void setup(){
  size(400,400,P3D);
  colorMode(HSB,360,100,100);
  fill(100,80,80);
  
  textAlign(CENTER);
  frameRate(30);
}

void draw(){
  background(0);
  
  int year = year();
  int month = month();
  int day = day();
  int hour = hour();
  int minute = minute();
  int second = second();
  
  if(z>200 || z<-200) dz = (-1)*dz;
  z += dz;
  textSize(30);
  text(year+"/"+month+"/"+day+"/"+hour+":"+minute+":"+second,200,200,z);
  
}