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
  RachelCubeClass box;
  RachelCubeClass betterBox;
  RachelCubeClass evenBetterBox;
  float average = 0;
  float lerpedAverage = 0;
  
  //Thomas Variables
  float lerpedAverageT = 0;

  float[] lerpedBufferT = new float[512];

  ArrayList<RachelCubeClass> cubes = new ArrayList<RachelCubeClass>();
  int numCubes = 0;
  
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
    box = new RachelCubeClass(150,0.02f,20,color(30,140,200),width/2,height/2);
    betterBox = new RachelCubeClass(50,0.04f,10,color(90,70,100),width/2,height/2);
    evenBetterBox = new RachelCubeClass(250,0.01f,10,color(90,70,100),width/2,height/2);
    
    //Jess Variable Assignment
    jessFFT = new FFT(music.ab.size(), music.ai.sampleRate());
    speaker1 = new Speakers(75, 3, -PI/5, width - 90, height/2);
    speaker2 = new Speakers(75, 3, PI/5, 90, height/2);
    bg = new Background();
    
    //Thomas Variable Assignment
    
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
        textAlign(CENTER);
        textSize(30);
        text("Team Radix Audio Assignment",width/2,height/2);
        textSize(20);
        text("Press Keys 1-4 to see some cool a*s visuals", width/2,300);
        break;
     
        
      case 1:
        //Lauren Class Calls
        laurensAwesomeFFT.forward(music.ab);
        float value = laurensAwesomeFFT.getBand(500) * 10;
        myCircle.update(value);
        myCircle.display();
        break;
        
        
      case 2:
      //rachel class calls
        float total = 0;
    
        for(int i = 0; i < music.ab.size(); i++){
          total += abs(music.ab.get(i));
        }
  
        average = total / (float) music.ab.size();
        lerpedAverage = lerp(lerpedAverage, average, 0.1f);
    
        background(0);
        noStroke();
    
        lights();
    
        float hue = map(lerpedAverage,0.0f, 0.3f, 0,255);
        color c = color(hue,255,255);
   
    
        box.speed = map(lerpedAverage, 0.0f, 1.0f, 0, 0.1);
        betterBox.speed = map(lerpedAverage, 0.0f, 1.0f, 0, 0.08);
        evenBetterBox.speed = map(lerpedAverage, 0.0f, 1.0f, 0, 0.13);
    
        box.size = map(lerpedAverage, 0.0f, 1.0f, 80, 370);
        betterBox.size = map(lerpedAverage, 0.0f, 1.0f, 10, 180);
        evenBetterBox.size = map(lerpedAverage, 0.0f, 1.0f, 180, 650 );
    
        box.c = c;
        betterBox.c = c;
        evenBetterBox.c = c;
    
        box.update();
        box.render();
    
        betterBox.update();
        betterBox.render();
    
        evenBetterBox.update();
        evenBetterBox.render();
  
        for(int i = 0; i < cubes.size(); i++){
          RachelCubeClass current = cubes.get(i);
          current.speed = map(lerpedAverage, 0.0f, 1.0f, 0, 0.1) + random(-0.02,0.02);
          current.size = map(lerpedAverage, 0.0f, 1.0f, 10, 180);
          current.c = c;
      
          current. update();
          current.render();
          
        }
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
        float m = map(1, 0, 100, 200, 400);
  
  
        background(0);
        colorMode(HSB);
        stroke(255);
        float half = height / 2;
        float totalT = 0;
        for (int i = 0 ; i < music.ab.size(); i ++)
        {
          totalT += abs(music.ab.get(i));
          float cT = map(i, 0, music.ab.size(), 0, 255);
          stroke(cT, 255, 255);
          lerpedBufferT[i] = lerp(lerpedBufferT[i], music.ab.get(i), 0.1f);
          line(i, half, i, half + (lerpedBufferT[i] * half * 4));
        }
        float average = totalT / (float) music.ab.size();
        
        lerpedAverage = lerp(lerpedAverage, average, 0.1f);
        
        float radiusT = 50 + (lerpedAverage * 500);
        circle(width / 2, 200, radiusT);
        break;
    }
  }
}
