class DJ{
  
  PImage dj;
  
  DJ(){
    dj = loadImage("guy.png");
  }

  void render(){
    fill(0);
    
    //lights();
    pushMatrix();
    scale(0.5);
    translate(width/2,height/2);
    //box(10);
    image(dj, 0, 0);
    print("r");
    popMatrix();
  }

}
