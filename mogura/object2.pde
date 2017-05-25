float my_timer2;
void object2(){
  
  my_timer2 = my_timer2 + 0.6;
  //body
  fill(102, 0, 64);
  pushMatrix();
  translate(0, 0, 0);
  scale(65, 5, 5);
  sphere(1);
  popMatrix();
  //eyes
  fill(255, 255, 255);
  pushMatrix();
  translate(65, -4, 0);
  scale(4, 4, 4);
  sphere(1);
  popMatrix();
  fill(255, 255, 255);
  pushMatrix();
  translate(65, 4, 0);
  scale(4, 4, 4);
  sphere(1);
  popMatrix();
  
  //wing
  fill(102, 0, 64, 70);
  pushMatrix();
  translate(50, 0, 0);
  scale(5, 68, 2);
  rotate(PI*sin(my_timer2)/2.0);
  sphere(1);
  popMatrix();
  fill(102, 0, 64, 70);
  pushMatrix();
  translate(40, 0, 0);
  scale(5, 68, 2);
  rotate(PI*sin(my_timer2)/2.0);
  sphere(1);
  popMatrix();
  
  
}