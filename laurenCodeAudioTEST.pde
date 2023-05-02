import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

FFT laurensAwesomeFFT;

LaurensAwesomeCircle myCircle;

void setup() {
  size(512, 512);
  colorMode(HSB);
  
  m = new Minim(this);
  ap = m.loadFile("Fixx_Reach_the_Beach.mp3", 512);
  ai = m.getLineIn(Minim.STEREO, 2048);
  ab = ap.mix;
  ap.play();
  
  laurensAwesomeFFT = new FFT(ab.size(), ai.sampleRate());
  myCircle = new LaurensAwesomeCircle(width/2, height/2, 200);
}

int bufferSize = 512;

Minim m;
AudioInput ai;
AudioPlayer ap;
AudioBuffer ab;

float lerpedAverage = 0;

float[] lerpedBuffer = new float[bufferSize];

float map1(float a, float b, float c, float d, float e)
{
  float r1 = c - b;
  float r2 = e - d;
  float r3 = a - b;
  
  return d + (r3 / r1) * r2; 
}

float lerp1(float a, float b, float t)
{
  return a + (b-a) * t;
}

void draw()
{
  background(0);
  colorMode(HSB);
  stroke(255);
  float half = height / 2;
  float total = 0;
  for (int i = 0 ; i < ab.size(); i ++)
  {
    total += abs(ab.get(i));
    float c = map(i, 0, ab.size(), 0, 255);
    stroke(c, 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.1f);
    line(i, half, i, half + (lerpedBuffer[i] * half * 4));
  }
  float average = total / (float) ab.size();
  
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  
  float radius = 50 + (lerpedAverage * 500);
  myCircle.update(radius);
  myCircle.display();
  
  background(0);
  
  laurensAwesomeFFT.forward(ab);
  float value = laurensAwesomeFFT.getBand(500) * 10;
  myCircle.update(value);
  myCircle.display();
}

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
