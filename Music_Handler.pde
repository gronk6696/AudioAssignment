import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

class MusicHandler {
  
  Minim m;
  String fileName;
  AudioInput ai;
  AudioPlayer ap;
  AudioBuffer ab;
  
  MusicHandler(Minim minim, String fileName){
    this.m = minim;
    this.fileName = fileName;
  }
  
  void initiateMusic(){
    ap = m.loadFile(fileName, 512);
    ai = m.getLineIn(Minim.STEREO, 2048);
    ab = ap.mix;
    ap.play();
  }
  


}
