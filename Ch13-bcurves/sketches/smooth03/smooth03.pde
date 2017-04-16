void setup() {
   size(600, 400);
   background(214, 242, 206);
   noFill();
}

void drawCurve(boolean drawCircles, boolean drawLines,
               int p0, int p1, int p2, int p3) {

   // control point 1
   stroke(255,  0, 0);   // red
   if (drawCircles == true) {
      ellipse(Xp[p0], Yp[p0], 15, 15);
   }
   if (drawLines == true) {
      line(Xp[p0], Yp[p0], Xp[p1], Yp[p1]);
   }

   // control point 1
   stroke(0, 0, 255);   // blue
   if (drawCircles == true) {
      ellipse(Xp[p3], Yp[p3], 15, 15);
   }
   if (drawLines == true) {
      line(Xp[p3], Yp[p3], Xp[p2], Yp[p2]);
   }

   // the knots
   stroke(0, 0, 0);   // black
   if (drawCircles == true) {
      ellipse(Xp[p1], Yp[p1], 15, 15);
      ellipse(Xp[p2], Yp[p2], 15, 15);
   }

   bezier(Xp[p0], Yp[p0], Xp[p1], Yp[p1], Xp[p2], Yp[p2], Xp[p3], Yp[p3]);
}

//               A0   A1   A2   A3   B0   B1   B2   B3
float [] Xp = { 100, 150, 200, 250, 250, 300, 350, 400 };
float [] Yp = { 150, 100, 250, 200, 200, 150, 200, 200 };

void draw() {
   noFill();
   drawCurve(true, true, 0, 1, 2, 3);  // curve A
   drawCurve(true, true, 4, 5, 6, 7);  // curve B
}
