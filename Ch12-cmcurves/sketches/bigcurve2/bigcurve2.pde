int NumPoints = 6;
float [] Xp;
float [] Yp;

void setup() {
   size(600, 400);
   background(194, 216, 242);
   noFill();
   Xp = new float[NumPoints];
   Yp = new float[NumPoints];
   for (int i=0; i<NumPoints; i++) {
      Xp[i] = random(100, 500);
      Yp[i] = random(100, 300);
   }
}

void draw() {
   for (int i=0; i<NumPoints; i++) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
}
