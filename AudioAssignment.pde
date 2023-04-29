import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(512, 512);
  
  m = new Minim(this);
  
  ap = m.loadFile("Fixx_Reach_the_Beach.mp3", 512);
  ab = ap.mix;
  ap.play();
  //ai = m.getLineIn(Minim.MONO, bufferSize, 44100, 16);
  //ab = ai.mix;
  
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
  
  // lerp(a, b, t)
  // map(a, b, c, d, e)
  // min(a, b)
  // max(a, b)
  // smoothstep
  // abs
  
  //float m = map(1, 0, 100, 200, 400);
  
  
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
  circle(width / 2, 200, radius);
  
  
}
