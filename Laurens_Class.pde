class LaurensAwesomeCircle {
  float x, y, diameter;
  
  LaurensAwesomeCircle(float x, float y, float diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
  
  void update(float value) {
    diameter = map(value, 0, 1, 50, 200);
    y = map(value, 0, 1, height - diameter, diameter);
  }
}
