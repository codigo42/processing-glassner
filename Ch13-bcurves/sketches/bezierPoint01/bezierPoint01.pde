float [] Xp = {  80,  160, 580, 380 };
float [] Yp = { 300,   0,   80, 300 };

void setup() {
  size(600, 400);
  background(237, 180, 198);
  noFill();
  bezier(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
  
  int numSteps = 8;
  for (int i=0; i<numSteps; i++) {
    float t = map(i, 0, numSteps-1, 0, 1);
    float xPos = bezierPoint(Xp[0], Xp[1], Xp[2], Xp[3], t);
    float yPos = bezierPoint(Yp[0], Yp[1], Yp[2], Yp[3], t);
    fill(255);
    strokeWeight(1);
    stroke(0, 0, 0);
    ellipse(xPos, yPos, 20, 20);
  }
}
