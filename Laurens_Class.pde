class laurensAwesomeClass {
  
  float x;
  float y;
  float circleRadius;
  
  laurensAwesomeClass(float x, float y, float circleRadius) {
    this.x = x;
    this.y = y;
    this.circleRadius = circleRadius;
  }
  
  void display() {
    ellipse(x, y, circleRadius, circleRadius);
  }
  
  void update(float value) {
    circleRadius = map(value, 0, 1, 50, 200);
    y = map(value, 0, 1, height - circleRadius, circleRadius);
  }
  
}
