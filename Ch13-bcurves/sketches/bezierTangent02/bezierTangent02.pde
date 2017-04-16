float [] Xp = {  80,  160, 580, 380 };
float [] Yp = { 300,   0,   80, 300 };

void setup() {
  size(600, 400);
  background(237, 180, 198);
  noFill();
  bezier(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
  
  float oldx0 = 0;
  float oldy0 = 0;
  float oldx1 = 0;
  float oldy1 = 0;
  int numSteps = 40;
  strokeWeight(2);
  for (int i=0; i<numSteps; i++) {
    float t = map(i, 0, numSteps-1, 0, 1);
    float xPos = bezierPoint(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yPos = bezierPoint(Yp[0], Yp[1], Yp[2], Yp[3], t);
    float xTan = bezierTangent(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yTan = bezierTangent(Yp[0], Yp[1], Yp[2], Yp[3], t);
    float tanlen = mag(xTan, yTan);
    xTan *= 20/tanlen;
    yTan *= 20/tanlen;
    if (i > 0) {
      line(oldx0, oldy0, xPos-yTan, yPos+xTan);
      line(oldx1, oldy1, xPos+yTan, yPos-xTan);
    }
    oldx0 = xPos-yTan;
    oldy0 = yPos+xTan;
    oldx1 = xPos+yTan;
    oldy1 = yPos-xTan;
  }
}
