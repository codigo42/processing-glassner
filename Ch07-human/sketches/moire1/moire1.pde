void setup() {
  size(600, 400);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);  // mouse input will go here
  fill(0, 0, 0);
  drawStar();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(TWO_PI * frameCount/800);
  translate(0, 70);
  fill(0, 0, 0);
  drawStar();
  popMatrix();
}

void drawStar() {
  int numSpokes = 100;
  for (int i=0; i<numSpokes; i++) {
     float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
     float t1 = t0 + (TWO_PI/(2*numSpokes));
     arc(0, 0, 1000, 1000, t0, t1);
  }
}
