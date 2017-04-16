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
   for (int i=0; i<NumPoints; i++) {
      int p0 = (i  )%NumPoints;
      int p1 = (i+1)%NumPoints;
      int p2 = (i+2)%NumPoints;
      int p3 = (i+3)%NumPoints;
      //println("p0="+p0+ " p1="+p1+" p2="+p2+" p3="+p3);
      curve(Xp[p0], Yp[p0], Xp[p1], Yp[p1], Xp[p2], Yp[p2], Xp[p3], Yp[p3]);
   }
}
