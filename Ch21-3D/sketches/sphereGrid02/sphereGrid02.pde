void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(225, 192, 145);
  directionalLight(255, 255, 255, -1, 0,  -1);
  fill(128, 183, 135);
  perspective(radians(20), 1, -10, 10);
  drawPicture();
  noLoop();
}

void drawPicture() {
  noStroke();
  int ysteps = 6;
  int xsteps = 6; 
  for (int y=0; y<ysteps; y++) {
    for (int x=0; x<xsteps; x++) {
      float xalpha = x/(xsteps-1.0);
      float yalpha = y/(ysteps-1.0);
      float xpos = lerp(230, 370, xalpha);
      float ypos = lerp(230, 370, yalpha);
      int latitudeRes = int(lerp(3, 30, xalpha));
      int longitudeRes = int(lerp(3, 30, yalpha));
      sphereDetail(latitudeRes, longitudeRes);
      pushMatrix();
      translate(xpos, ypos, 0);
      sphere(10);
      popMatrix();
    }
  }
}
