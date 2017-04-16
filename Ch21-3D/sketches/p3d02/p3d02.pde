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
  fill(241, 100, 95);
  drawPolygon();
}

void drawPolygon() {
  beginShape();
  vertex(-.2, -.4, 0);
  vertex( .2, -.4, 0);
  vertex( .2,  .4, 0);
  vertex(-.2,  .4, 0);
  endShape(CLOSE);
}  

