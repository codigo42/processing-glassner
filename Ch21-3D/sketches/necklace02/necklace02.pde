import processing.opengl.*;

void setup() {
  size(600, 400, OPENGL);
}

void draw() {
  background(180, 219, 180);
  lights();
  camera();
  translate(width/2, height/2, 0.0);
  scale(width/2, height/2, 1.0);
  
  fill(50, 106, 102);
  sphere(0.5);
}
