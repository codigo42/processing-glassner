float [] Xp = {  40,  50, 540, 300 };
float [] Yp = { 940, 160, 200, 900 };

void setup() {
  size(600, 400);
  background(237, 180, 198);
  noFill();
  curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
  
  float oldx0 = 0;
  float oldy0 = 0;
  float oldx1 = 0;
  float oldy1 = 0;
  float newx0 = 0;
  float newy0 = 0;
  float newx1 = 0;
  float newy1 = 0;
  int numSteps = 20;
  strokeWeight(2);
  for (int i=0; i<numSteps; i++) {
    float t = map(i, 0, numSteps-1, 0, 1);
    float xPos = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yPos = curvePoint(Yp[0], Yp[1], Yp[2], Yp[3], t);
    float xTan = curveTangent(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yTan = curveTangent(Yp[0], Yp[1], Yp[2], Yp[3], t);
    float tanlen = mag(xTan, yTan);
    xTan *= 20/tanlen;
    yTan *= 20/tanlen;
    newx0 = xPos-yTan;
    newy0 = yPos+xTan;
    newx1 = xPos+yTan;
    newy1 = yPos-xTan;
    if (i > 0) {
      line(oldx0, oldy0, newx0, newy0);
      line(oldx1, oldy1, newx1, newy1);
    }
    oldx0 = newx0;
    oldy0 = newy0;
    oldx1 = newx1;
    oldy1 = newy1;
  }
}
