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

   background(194, 216, 242);
   for (int i=0; i<NumPoints; i++) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
   strokeWeight(8);
   stroke(255);
   line(Xp[5], Yp[5], Xp[6], Yp[6]);
   stroke(0);
   strokeWeight(1);
   
   beginShape();
   for (int i=0; i<7; i++) curveVertex(Xp[i], Yp[i]);  // points 0-6
   vertex(Xp[6], Yp[6]);                               // point 5
   for (int i=5; i<10; i++) curveVertex(Xp[i], Yp[i]); // points 5-9
   endShape();
}
