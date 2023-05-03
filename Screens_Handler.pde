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
  
  int screen = 0;
  
  ScreensHandler(Minim m){
    //Music Activation
    this.m = m;
    music = new MusicHandler(m,"Fixx_Reach_the_Beach.mp3");
    music.initiateMusic();
      
    //Lauren Variable Assignment 
    laurensAwesomeFFT = new FFT(music.ab.size(), music.ai.sampleRate());
    myCircle = new LaurensAwesomeCircle(width/2, height/2, 200);
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
        //Rachel Class Calls
        break;
      case 3:
        //Jess Class Calls
        break;
      case 4:
        //Thomas Class Calls
        break;
    }
  }
}
