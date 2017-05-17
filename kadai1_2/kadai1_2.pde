void setup(){
  size(1600,1600);
  colorMode(HSB,360,100,100);
  //rectMode(CENTER);
  background(360);
  noStroke();
}

void draw(){
  for(int y=0;y<10;y++){
    for(int x=0;x<10;x++){
      
      fill(320-((x+y)*0.9),70,100-(x+y)*7);
      rect(80*x,80*y,80,80);
      rect(1520+(-1)*(80*x),80*y,80,80);
      rect(80*x,1520+(-1)*(80*y),80,80);
      rect(1520+(-1)*(80*x),1520+(-1)*(80*y),80,80);
      
        for(int i=50;i>1;i--){
          fill(320-((x+y)*0.9),80,100-(x+y)*i*sin((x+y)*10*PI/i));
          ellipse(40+80*x,40+80*y,i,i);
          ellipse(1600+(-1)*(40+80*x),40+80*y,i,i);
          ellipse(40+80*x,1600+(-1)*(40+80*y),i,i);
          ellipse(1600+(-1)*(40+80*x),1600+(-1)*(40+80*y),i,i);
          
        }
      }
    }
    
    for(int y=0;y<21;y++){
      for(int x=0;x<21;x++){
        
        fill(285,100,(x+y)*3);
        ellipse(80*x,80*y,5,5);
        ellipse(1520+(-1)*x*80,y*80,5,5);
        ellipse(x*80,1520+(-1)*y*80,5,5);
        ellipse(1520+(-1)*x*80,1520+(-1)*y*80,5,5);
      }
    }
  }

void keyPressed() {
  if ( key == ' ' ) {
    saveFrame( "kadai1.png" );
  }
}