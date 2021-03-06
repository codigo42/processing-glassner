void setup() {
  size(600, 600, P3D);
  translate(300, 300, 0);
  background(191, 223, 227);
  fill(128, 128, 128); makeBox(0, 0, 0);    // gray box at origin 
  fill(209,  98, 133); makeBox(150, 0, 0);  // red box on +X axis
  fill(153, 229, 149); makeBox(0, 150, 0);  // green box on +Y axis
  fill( 45, 111, 173); makeBox(0, 0, 150);  // blue box on +Z axis
}

void makeBox(float tx, float ty, float tz) {
  pushMatrix();
  translate(tx, ty, tz);
  box(100);
  popMatrix();
}
