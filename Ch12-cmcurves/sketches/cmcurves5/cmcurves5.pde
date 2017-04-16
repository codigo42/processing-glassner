void setup() {
   size(600, 400);
   background(242, 240, 174);
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

   // control point 2
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

   curve(Xp[p0], Yp[p0], Xp[p1], Yp[p1], Xp[p2], Yp[p2], Xp[p3], Yp[p3]);
}

float [] Xp = { 100, 300, 300, 100 };
float [] Yp = { 100, 100, 300, 300 };

void draw() {
   drawCurve(true, true, 0, 1, 2, 3);
}
