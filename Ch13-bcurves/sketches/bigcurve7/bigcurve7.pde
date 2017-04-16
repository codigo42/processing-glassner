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
   // move first point
   for (int i=4; i<NumPoints; i+=4) {
      Xp[i] = Xp[i-1];
      Yp[i] = Yp[i-1];
   }
   Xp[0] = Xp[NumPoints-1];
   Yp[0] = Yp[NumPoints-1];
   
   // move second point
   for (int i=5; i<NumPoints; i+=4) {
      Xp[i] = Xp[i-1] + (Xp[i-2] - Xp[i-3]);
      Yp[i] = Yp[i-1] + (Yp[i-2] - Yp[i-3]);
   }
   Xp[1] = Xp[0] + (Xp[NumPoints-1] - Xp[NumPoints-2]);
   Yp[1] = Yp[0] + (Yp[NumPoints-1] - Yp[NumPoints-2]);
   
   for (int i=0; i<NumPoints; i+=4) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
   for (int i=0; i<NumPoints; i+=4) {
      bezier(Xp[i],   Yp[i],   Xp[i+1], Yp[i+1],
      Xp[i+2], Yp[i+2], Xp[i+3], Yp[i+3]);
   }
}
