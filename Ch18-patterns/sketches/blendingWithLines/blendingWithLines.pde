void setup() {
  size(600, 400);
  background(210);
  noFill();
  stroke(0);
  strokeWeight(2);
  smooth();
  float v1 = 0;
  float v2 = .5;
  float v3 = 1;
  drawSet(v1, v2, v3, false, 50, 50);
  drawSet(v1, v2, v3, true, 50, 250);
}

void drawSet(float v1, float v2, float v3, boolean useCosine, int xLeft, int yTop) {
  drawBlend(v1, v1, xLeft,     100, yTop, 100, useCosine);
  drawBlend(v1, v2, xLeft+100, 100, yTop, 100, useCosine);
  drawBlend(v2, v2, xLeft+200, 100, yTop, 100, useCosine);
  drawBlend(v2, v3, xLeft+300, 100, yTop, 100, useCosine);
  drawBlend(v3, v3, xLeft+400, 100, yTop, 100, useCosine);
}

void drawBlend(float v1, float v2, int xLeft, int wid, int yTop, int hgt, boolean useCosine) {
  int xRight = xLeft + wid;
  float oldx = xLeft;
  float oldy = yTop + (hgt*v1);
  for (int x=xLeft; x<xRight; x++) {
     float a = map(x, xLeft, xRight-1, 0, 1);
     if (useCosine) a = map(cos(a*radians(180)), 1, -1, 0, 1);
     float y = yTop + (hgt*lerp(v1, v2, a));
     line(oldx, oldy, x, y);
     oldx = x;
     oldy = y;
  }
}
