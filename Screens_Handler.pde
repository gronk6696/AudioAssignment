import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

class ScreensHandler{
  //Lauren Variables 
  FFT laurensAwesomeFFT;
  LaurensAwesomeCircle myCircle;
  
  //Music Variables
  MusicHandler music;
  Minim m;
  
  //Rachel Variables
  RachelCubeClass cube;
  
  //Jess Variables
  Speakers speaker1;
  Speakers speaker2;
  Background bg;
  FFT jessFFT;
  
  int screen = 0;
  
  ScreensHandler(Minim m){
    //Music Activation
    this.m = m;
    music = new MusicHandler(m,"Fixx_Reach_the_Beach.mp3");
    music.initiateMusic();
      
    //Lauren Variable Assignment 
    laurensAwesomeFFT = new FFT(music.ab.size(), music.ai.sampleRate());
    myCircle = new LaurensAwesomeCircle(width/2, height/2, 200);
    
    //Rachel Variable Assignment
    cube = new RachelCubeClass();
    
    //Jess Variable Assignment
    jessFFT = new FFT(music.ab.size(), music.ai.sampleRate());
    speaker1 = new Speakers(75, 3, -PI/5, width - 90, height/2);
    speaker2 = new Speakers(75, 3, PI/5, 90, height/2);
    bg = new Background();
  }
  
  void keyPressed(){
    if(!(key == 0)){viewScreen(int(key)-48);}
    else{viewScreen(0);}
  }
    
    
  void viewScreen(int screen){
    switch (screen){
      
      
      case 0:
        //Main Menu
        fill(255);
        text("Main Menu Placeholder",100,100);
        break;
        
        
      case 1:
        //Lauren Class Calls
        laurensAwesomeFFT.forward(music.ab);
        float value = laurensAwesomeFFT.getBand(500) * 10;
        myCircle.update(value);
        myCircle.display();
        break;
        
        
      case 2:
        // Calculate the scale factor based on the average amplitude of the audio
        lights();
        fill(70,255,255);
        float[] leftChannel = music.ap.left.toArray();
        float[] rightChannel = music.ap.right.toArray();
        float totalAmplitude = 0;
        for (int i = 0; i < leftChannel.length; i++) {
          totalAmplitude += (abs(leftChannel[i]) + abs(rightChannel[i])) / 2;
        }
        float averageAmplitude = totalAmplitude / leftChannel.length;
        cube.setScaleFactor(1 + (averageAmplitude * 10));

        // Rotate the cube based on the amplitude of a particular frequency range
        FFT fft = new FFT(music.ap.bufferSize(), music.ap.sampleRate());
        fft.forward(music.ap.mix);
        float frequencyAmplitude = fft.getBand(512); // Change this number to adjust the frequency range
        cube.setAngle(frequencyAmplitude);

        // Draw the cube
        cube.drawCube();
        break;
        
        
      case 3:
        background(0);
        stroke(255);
        bg.render();
        
        jessFFT.forward(music.ab);
        float jessValue = jessFFT.getBand(500) * 5;
        float beatValue = map(jessValue, 0, 1.8, 0, 100);
        
        speaker1.beatValue = beatValue;
        speaker2.beatValue = beatValue;
        bg.radius = beatValue;
        
        if(beatValue> 70){
          speaker1.collapse();
          speaker2.collapse();
        }
        speaker1.render();
        speaker2.render();
        
        break;
      case 4:
        //Thomas Class Calls
        break;
    }
  }
}
