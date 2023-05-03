class RachelCubeClass {
  private float angle;
  private float scaleFactor;
  
  RachelCubeClass() {
    angle = 0;
    scaleFactor = 1;
  }
  
  void setAngle(float a) {
    angle += a;
  }
  
  void setScaleFactor(float sf) {
    scaleFactor = sf;
  }
  
  void drawCube() {
    float halfHeight = height/2;
    float halfWidth = width/2;
    
    pushMatrix();
    translate(halfWidth, halfHeight, -halfHeight);
    rotateX(angle);
    rotateY(angle);
    scale(scaleFactor);
    box(100);
    popMatrix();
  }
}
