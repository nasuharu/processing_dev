void object(){
  
  //body
  fill(112, 69, 17);
  pushMatrix();
  translate(0, 0, 0);
  scale(100, 200, 100);
  sphere(1);
  popMatrix();
  
  //nose
  fill(191, 151, 103);
  pushMatrix();
  translate(0, -190, 0);
  scale(30, 30, 30);
  sphere(1);
  popMatrix();

}