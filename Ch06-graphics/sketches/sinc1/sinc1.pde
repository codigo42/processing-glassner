import processing.opengl.*;

void setup() {
  size(600, 400, OPENGL);
}

// a pulsing sinc made of a single quadstrip spiral

void draw() {
  background(108, 131, 166);
  lights();
  translate(width/2, 3*height/8);
  rotateX(radians(55));
  scale(height/2, height/2);
  
  fill(225, 215, 170);
  
  float ringWidth = .04;
  int ringSteps = 8;
  int maxi = 240;
  beginShape(QUAD_STRIP);
  for (int i=-ringSteps; i<maxi; i++) {
    float r0 = ringWidth * (i*1.0/ringSteps);
    float r1 = r0 + ringWidth;
    if (r0 < 0) r0 = 0;
    float theta = i * (TWO_PI / ringSteps);
    makeVertex(r0, theta);
    makeVertex(r1, theta);
  }
  endShape(CLOSE);
}  

void makeVertex(float r, float theta) {
   float x = r*cos(theta);
   float y = r*sin(theta);
   float z = 100 * exp(-3*r*r) * cos((r * 2 * TWO_PI) - (frameCount/50.0));
   vertex(x, y, z);
}

