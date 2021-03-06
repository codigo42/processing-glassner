float [] Xp;
float [] Yp;
int NumPoints = 10;

void setup() {
   size(600, 400);
   noFill();
   Xp = new float[NumPoints];
   Yp = new float[NumPoints];
   for (int i=0; i<NumPoints; i++) {
      Xp[i] = random(100, 500);
      Yp[i] = random(100, 300);
   }
}

void draw() {
   background(194, 216, 242);
   for (int i=0; i<NumPoints; i++) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
   float tightness = map(sin(frameCount * .1), -1, 1, 0, 1);
   curveTightness(tightness);
   beginShape();
   for (int i=0; i<NumPoints+3; i++) {
      int j = (i+1)%NumPoints;
      curveVertex(Xp[j], Yp[j]);
   }
   endShape();
}
