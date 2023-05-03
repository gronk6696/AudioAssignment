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
