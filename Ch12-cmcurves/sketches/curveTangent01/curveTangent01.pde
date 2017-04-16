float [] Xp = {  40,  50, 540, 300 };
float [] Yp = { 940, 160, 200, 900 };

void setup() {
  size(600, 400);
  background(237, 180, 198);
  noFill();
  curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
  
  int numSteps = 8;
  for (int i=0; i<numSteps; i++) {
    float t = map(i, 0, numSteps-1, 0, 1);
    float xPos = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yPos = curvePoint(Yp[0], Yp[1], Yp[2], Yp[3], t);
    fill(255);
    strokeWeight(1);
    stroke(0, 0, 0);
    ellipse(xPos, yPos, 20, 20);
    
    float xTan = curveTangent(Xp[0], Xp[1], Xp[2], Xp[3], t)/20;
    float yTan = curveTangent(Yp[0], Yp[1], Yp[2], Yp[3], t)/20;
    strokeWeight(3);
    stroke(40, 62, 209);
    line(xPos-xTan, yPos-yTan, xPos+xTan, yPos+yTan);
  }
}
