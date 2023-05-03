
// Initialise Variables

//Music Handler
MusicHandler music;
int bufferSize = 512;
Minim m;

//Lauren Variables 
FFT laurensAwesomeFFT;
LaurensAwesomeCircle myCircle;


void setup() {
  //Screen Setup
  size(512, 512);
  colorMode(HSB);
  
  //Music Activation
  m = new Minim(this);
  music = new MusicHandler(m,"Fixx_Reach_the_Beach.mp3");
  music.initiateMusic();
  
  //Laurne Variable Assignment 
  laurensAwesomeFFT = new FFT(music.ab.size(), music.ai.sampleRate());
  myCircle = new LaurensAwesomeCircle(width/2, height/2, 200);
}



void draw()
{
  //Scene Setup
  background(0);
  colorMode(HSB);
  stroke(255);
  
  //Lauren Class Calls
  laurensAwesomeFFT.forward(music.ab);
  float value = laurensAwesomeFFT.getBand(500) * 10;
  myCircle.update(value);
  myCircle.display();
  
}
