public class ThomasWave {
  float x,y, weight;
  color c;
  
  ThomasWave(float x, float y, float weight, color c) {
    this.x = x;
    this.y = y;
    this.weight = weight;
    this.c = c;
  }
  
  
  void display() {
    strokeWeight(weight);
    stroke(c);
    line(x, height/2, width, y);
  }
  
  void update(float valueT) {
  float half = height / 2;
  float total = 0;
  for (int i = 0 ; i < m.size(); i ++)
  {
    total += abs(m.get(i));
    float c = map(i, 0, m.size(), 0, 255);
    stroke(c, 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], m.get(i), 0.1f);
    line(i, half, i, half + (lerpedBuffer[i] * half * 4));
  }
  float average = total / (float) m.size();
  
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
    }
  }
}
