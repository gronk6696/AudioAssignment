
// Initialise Variables

//Music Variables
Minim m;

//Screen handler
ScreensHandler screens;

void setup() {
  //Screen Setup
  size(512, 512, P3D);
  colorMode(HSB);
  m = new Minim(this);
  screens = new ScreensHandler(m);

}


void draw()
{
  //Scene Setup
  background(0);
  colorMode(HSB);
  stroke(255);
  screens.keyPressed();
}
