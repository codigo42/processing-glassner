void setup() {
  size(600, 400);
  background(128);
  noFill();
  color c1 = color(25, 45, 210);
  color c2 = color(250, 140, 0);
  color c3 = color(65, 120, 80);
  colorMode(HSB);
  drawSet(c1, c2, c3, false, 50, 50);
  drawSet(c1, c2, c3, true, 50, 250);
}

void drawSet(color c1, color c2, color c3, boolean useCosine, int xLeft, int yTop) {
  drawBlend(c1, c1, xLeft,     100, yTop, 100, useCosine);
  drawBlend(c1, c2, xLeft+100, 100, yTop, 100, useCosine);
  drawBlend(c2, c2, xLeft+200, 100, yTop, 100, useCosine);
  drawBlend(c2, c3, xLeft+300, 100, yTop, 100, useCosine);
  drawBlend(c3, c3, xLeft+400, 100, yTop, 100, useCosine);
}

void drawBlend(color c1, color c2, int xLeft, int wid, int yTop, int hgt, boolean useCosine) {
  int xRight = xLeft + wid;
  for (int x=xLeft; x<xRight; x++) {
     float a = map(x, xLeft, xRight-1, 0, 1);
     if (useCosine) a = map(cos(a*radians(180)), 1, -1, 0, 1);
     color stripe = lerpColor(c1, c2, a);
     stroke(stripe);
     line(x, yTop, x, yTop+hgt);
  }
}
