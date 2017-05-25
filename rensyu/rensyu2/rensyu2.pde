PImage a;
int mm = 0;

void setup(){
  size(800,600);
  a = loadImage("DSC_0102.JPG");
  colorMode(HSB,360,100,100);
}

void draw(){
  image(a,0,0,800,600);
  loadPixels();
  for(int i =0;i<width*height;i++){
    color p = pixels[i];
    float h = hue(p);
    float s = saturation(p);
    float b = brightness(p);
    b -= mm;
    pixels[i] = color(h,s,b);
  }
  updatePixels();
}

void mousePressed(){
  mm += 10;
}