  void eyes(){
    
  if (mousePressed == false){
    fill(0, 0, 0);
    pushMatrix();
    translate(-30, -150, 60);
    scale(10, 10, 10);
    sphere(1);
    popMatrix();
    
    fill(0, 0, 0);
    pushMatrix();
    translate(30, -150, 60);
    scale(10, 10, 10);
    sphere(1);
    popMatrix();
  }
  else{  //目が赤く光る
    fill(255, 0, 0);
    pushMatrix();
    translate(-30, -150, 60);
    scale(10, 10, 10);
    sphere(1);
    popMatrix();
    
    fill(255, 0, 0);
    pushMatrix();
    translate(30, -150, 60);
    scale(10, 10, 10);
    sphere(1);
    popMatrix();
  }
  
  }