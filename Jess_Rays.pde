class Ray{
  PVector centrePos, targetPos;
  int hue;
  
  Ray(int centreX, int centreY, int targetX, int targetY, int hue){
    this.centrePos = new PVector(centreX, centreY);
    this.targetPos = new PVector(targetX, targetY);
    this.hue = hue;
  }
  
  void render(){
    stroke(hue,255,200);
    strokeWeight(2);
    line(centrePos.x, centrePos.y, targetPos.x, targetPos.y);
  }

}
