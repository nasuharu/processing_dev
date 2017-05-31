float my_timer;
float x = 0.0;
float y = 0.0;

void setup() { 
  
  size(800, 800, P3D); 
  noStroke(); 
  my_timer = 0.0;
  
} 

void draw(){
  float easing;
  if(mousePressed == true){
    easing = 0.10;
  }
  else{
    easing = 0.03;
  }
  background(100);
  my_timer = my_timer + 0.1;
  lights();
  
  float X = mouseX;
  float Y = mouseY;
  x += (X - x)*easing;
  y += (Y - y)*easing;
  
  //座標設定
  pushMatrix(); 
  translate(width/2, height/2, -100); 
  
  //マウスの座標に向けてモグラが回転
  float a = atan2(y-height/2, x-width/2);
  rotate(a+PI/2.0);
  
  //モグラの手足の動作
  pushMatrix();
  rotateX(PI*sin(my_timer)/15.0);
  right();
  left();
  popMatrix();
  //各部位呼び出し
  object();
  eyes();
  popMatrix(); 
  
  
  //マウスを押してるとき変化
  if (mousePressed == true){
    
      //String s = "Food!";
      //fill(255, 255, 255);
      pushMatrix();
      //translate(-70, 0, 0);
      translate(mouseX,mouseY, 0);
      float c = atan2(mouseY-height/2, mouseX-width/2);
      rotate(c);
      object2();
      //textSize(50);
      //文字表示
      //text(s,mouseX,mouseY,0);
      popMatrix();
      
  }
  
  else{  //マウスを押してない時マウス位置に表示
  
    pushMatrix();
    translate(mouseX,mouseY, 0);
    float c = atan2(mouseY-height/2, mouseX-width/2);
    rotate(c+PI);
    object2();
    popMatrix();
    
  }

} 

void keyPressed() {
  if ( key == ' ' ) {
    saveFrame( "kadai####.png" );
  }
}