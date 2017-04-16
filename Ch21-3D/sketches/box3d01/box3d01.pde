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
  fill(128, 173, 135);
  rotateX(frameCount * .02);
  rotateY(frameCount * .013);
  box(.4, .8, 1);
}

