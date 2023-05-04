class Speakers{
  
  int speakerWidth, speakerHeight;
  float rotation, newSpeakerHeight, newSpeakerWidth, hue;
  PVector pos;
  
  float beatValue = 0;
  
  
  Speakers(int speakerWidth, int speakerHeightScale, float rotation, int xPos, int yPos){
    this.speakerWidth = speakerWidth;
    this.speakerHeight = speakerHeightScale;
    this.rotation = rotation;
    this.pos = new PVector(xPos, yPos);
    
    newSpeakerHeight = 1;
    newSpeakerWidth = 1;
  }

  void render(){
    lights();
    strokeWeight(1);
    stroke(255);
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotateY(rotation);
      scale(newSpeakerWidth, newSpeakerHeight, 1);
      ammendShape();
      
      pushMatrix();
      fill(0);
      scale(1, speakerHeight , 1);
      
      box(speakerWidth);
      popMatrix();
      //////
      pushMatrix();
      
      translate(0,0, speakerWidth/2 + 1);
      
      int circlePadding = speakerWidth/10;
      int circleCircum = speakerWidth - circlePadding*2;
      
      float goalColour = map(beatValue, 0f, 100f, 0f, 255f);
      hue = lerp(hue, goalColour, 0.05);
      
      
      fill(hue,255,255);
      for(int i = -1; i <= 1; i++){
        //if(i == 0){continue;}
        circle(0, (0 - (circlePadding + circleCircum))*i, circleCircum);
      }
      popMatrix();
    popMatrix();
  }

  void ammendShape(){
    if(!(newSpeakerHeight >= 1)){
      newSpeakerHeight += 0.05;
    }
    if(!(newSpeakerWidth <= 1)){
      newSpeakerWidth -= 0.09;
    }
  }
  
  void collapse(){
    newSpeakerHeight = 0.8;
    newSpeakerWidth = 1.2;
  }
  
}
