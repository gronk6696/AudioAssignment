class Background{

  float g = 0.0f;
  float increment = 0.1;
  float hue = 0;
  float radius;
  float pradius = 150;
  
  ArrayList<Ray> rays = new ArrayList<Ray>();

  
  Background(){
    
  }
  
  void render(){
    ray();
    pushMatrix();
    translate(height/2,width/2);
    background(0);
    stroke(255);
    strokeWeight(10);
    
    for(int j = 0; j < rays.size(); j++){
      Ray current = rays.get(j);
      current.render();
    }
    
    for(int i = 1; i<30;i++){
      float f = g - (increment*i) - 2;
      //hue = abs(map(sin(f),-1,1,0,255));
      hue = map(pradius, 0, 100, 0, 255);
      stroke(hue,255,255);
      strokeWeight(20);
      //point(x1(f),y1(f));
      point(x1(f),y1(f));
      //point(x2(f),y2(f));
      point(x3(f),y3(f));
      //point(x4(f),y4(f));
    }
    
    g += increment;
    popMatrix();
    radiusLerp();
  }
  
  void radiusLerp(){
    pradius = lerp(pradius, radius, 0.15);
  }
  
  void ray(){
    if(radius > 60){
      Ray ray = new Ray(0,0,round(random(-700,700)), round(random(-700,700)), round(random(150,255)));
      rays.add(ray);
    }
  }


  float y1(float g) { return sin(g) * pradius*2.5; }
  float x1(float g) { return cos(g) * pradius*2.5; }
  float y2(float g) { return sin(g/4) * pradius * 2.5; }
  float x2(float g) { return cos(g/6)  * pradius * 2.5; }
  
  float y3(float g) { return -sin(g) * pradius*2.5; }
  float x3(float g) { return -cos(g) * pradius*2.5; }
  float y4(float g) { return -sin(g/4) * pradius * 2.5; }
  float x4(float g) { return -cos(g/6)  * pradius * 2.5; }

}
