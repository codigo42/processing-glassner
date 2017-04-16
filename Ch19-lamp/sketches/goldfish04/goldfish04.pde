Goldfish Fish;
Spotfish Spot;

void setup() {
  size(600, 400);
  background(83, 181, 169);
  
  // create fish
  Fish = new Goldfish(color(255, 184, 51));
  Spot = new Spotfish(color(219, 101, 73), color(173, 171, 26));

  // show each fish, with and without a periscope
  Fish.render(100, 100, .5);
  Fish.render(100, 300, .5); 
  Fish.drawPeriscope(100, 300, .5);
  
  Spot.render(275, 100, .5);
  Spot.render(275, 300, .5); 
  Spot.drawPeriscope(275, 300, .5);
}

class Goldfish { 
  // Goldfish outline
  float [] fx = { 150, 130,  110, 90,  70,  50,   0, -40, -50, -80, -100, -80};
  float [] fy = {   0, -20,  -30, -40, -50, -50, -30, -10, -10, -40,  -30,  0};
  
  //periscope outline
  float [] px = {  90,  90,   95,  100,   130,  130,  150, 150, 130,  130,  120, 115, 110, 110 };
  float [] py = { -40, -110, -117, -120, -120, -125, -125, -95, -95, -100, -100, -97, -90, -30};
  
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
  
  // draw a periscope using this fish's color
  void drawPeriscope(float cx, float cy, float scl) {
    fill(fishColor);
    beginShape();
    for (int i=0; i<px.length; i++) vertex(cx+(scl*px[i]), cy+(scl*py[i]));
    endShape();
  }
}

class Spotfish extends Goldfish {
      
  // the color of the spot
  color spotColor;
  
  // the Spotfish constructor
  Spotfish(color afishColor, color aspotColor) {
    // call the Goldfish constructor to save this color
    super(afishColor);        
    // now save the color for the spot
    spotColor = aspotColor;
  }
  
  void render(float cx, float cy, float scl) {
     // ask the Goldfish to draw itself first
    super.render(cx, cy, scl); 
    // and now draw our own spot
    fill(spotColor);          
    ellipse(cx+(scl*75), cy+(scl* 10), 20, 20);
  }
}


