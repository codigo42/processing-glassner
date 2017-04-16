void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(144, 196, 224);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, 330, 270, 0);
  perspective(radians(20), 1, -10, 10);
  drawPicture();
  noLoop();
}

void drawPicture() {
  noStroke();
  color fillLeft = color(0, 0, 0);
  color fillRight = color(255, 0, 0);
  color specTop = color(0, 0, 0);
  color specBottom = color(0, 255, 0);
  int ysteps = 6;
  int xsteps = 6; 
  for (int y=0; y<ysteps; y++) {
    for (int x=0; x<xsteps; x++) {
      float xalpha = x/(xsteps-1.0);
      float yalpha = y/(ysteps-1.0);
      float xpos = lerp(230, 370, xalpha);
      float ypos = lerp(230, 370, yalpha);
      pushMatrix();
      translate(xpos, ypos, 0);
      sphere(10);
      popMatrix();
    }
  }
}
