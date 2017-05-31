class r{
  
  float x;  // x 座標
  float y;  // y 座標
  
  Object(){
    
  }
  void display() {
  // Display the circle
  //fill(0,life);
  fill(c,life,100); //水色の彩度をランダムに設定
  ellipse(x,y,w,w);
  }
  
  boolean enterKeyPressed() {
  
    if(key == ENTER){
      return true;
    }
    else  {return false;}
    
    void move() {
      // Add gravity to speed
      speed = speed + gravity;
      // Add speed to y location
      y = y + speed;
      // If square reaches the bottom
      // Reverse speed
      if (y > height) {
        // Dampening
        speed = speed * -0.9;
        y = height;
      }
    }
    
    boolean finished() {
    // Balls fade out
    life -= tranc;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    // Display the circle
    //fill(0,life);
    fill(c,life,100); //水色の彩度をランダムに設定
    ellipse(x,y,w,w);
  }
  
  }
}