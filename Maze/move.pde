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