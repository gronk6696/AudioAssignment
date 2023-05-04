class Ray{
  PVector centrePos, targetPos;
  int hue;
  float opacity = 255;
  
  Ray(int centreX, int centreY, int targetX, int targetY, int hue){
    this.centrePos = new PVector(centreX, centreY);
    this.targetPos = new PVector(targetX, targetY);
    this.hue = hue;
  }
  
  void render(){
    stroke(70,255,200, opacity);
    strokeWeight(3);
    line(centrePos.x, centrePos.y, targetPos.x, targetPos.y);
    opacity --;
  }

}
