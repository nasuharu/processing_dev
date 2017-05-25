void right(){
  //right hand
  fill(244, 210, 168);
  pushMatrix();
  translate(90, -110, 0);
  scale(10, 80, 50);
  rotate(PI/3.0);
  sphere(1);
  popMatrix();
  
  //right foot
  fill(244, 210, 168);
  pushMatrix();
  translate(-90, 100, 0);
  scale(10, 80, 50);
  sphere(1);
  popMatrix();
}