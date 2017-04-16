import processing.opengl.*;

void setup() {
  size(600, 600, OPENGL);
}

void draw() {
  background(225, 192, 145);
  lights();
  camera();
  smooth(); 
  translate(width/2, height/2);
  scale(width/2, height/2);
  drawPicture();
}

void drawPicture() {
  rotateX(frameCount * .02);
  rotateY(frameCount * .013);
  
  color color0 = color(241, 100, 95);
  color color1 = color(128, 173, 135);
  int numSteps = 30;
  for (int i=0; i<numSteps; i++) {
    float a = map(i, 0, numSteps-1, 0, 1);
    fill(lerpColor(color0, color1, a));
    translate(0, 0, -1.0/numSteps);
    drawPolygon();
  }
}

void drawPolygon() {
  beginShape();
  vertex(-.2, -.4, 0);
  vertex( .2, -.4, 0);
  vertex( .2,  .4, 0);
  vertex(-.2,  .4, 0);
  endShape(CLOSE);
}  

