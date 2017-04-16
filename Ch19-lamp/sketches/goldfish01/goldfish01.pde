Goldfish Fish;

void setup() {
  size(600, 400);
  background(83, 181, 169);
  
  Fish = new Goldfish(color(255, 184, 51));
  Fish.render(100, 100, .5);
}

class Goldfish { 
  // Goldfish outline
  float [] fx = { 150, 130,  110, 90,  70,  50,   0, -40, -50, -80, -100, -80};
  float [] fy = {   0, -20,  -30, -40, -50, -50, -30, -10, -10, -40,  -30,  0};
 
  // the color of this fish
  color fishColor;    
  
  // Goldfish constructor
  Goldfish(color afishColor) {    
    fishColor = afishColor;
  }
  
  // draw a Goldfish using this fish's color
  void render(float cx, float cy, float scl) {
    fill(fishColor);
    beginShape();
    for (int i=0; i<fx.length; i++) vertex(cx+(scl*fx[i]), cy+(scl*fy[i]));
    for (int i=fx.length-1; i>=0; i--) vertex(cx+(scl*fx[i]), cy+(scl*-fy[i]));
    endShape();
  }
}


