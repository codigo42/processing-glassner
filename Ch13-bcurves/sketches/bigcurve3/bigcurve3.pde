int NumPoints = 24;
float [] Xp;
float [] Yp;

void setup() {
   size(600, 400);
   background(206, 214, 242);
   noFill();
   Xp = new float[NumPoints];
   Yp = new float[NumPoints];
   for (int i=0; i<NumPoints; i++) {
      Xp[i] = random(100, 500);
      Yp[i] = random(100, 300);
   }
}

void draw() {
   for (int i=0; i<NumPoints; i+=4) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
   for (int i=0; i<NumPoints; i+=4) {
      bezier(Xp[i],   Yp[i],   Xp[i+1], Yp[i+1],
             Xp[i+2], Yp[i+2], Xp[i+3], Yp[i+3]);
   }
}
