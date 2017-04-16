float [] Xp = { -650,  150, 110, -290 };
float [] Yp = { 50, 50, 340, 200 };
int TimeAxisY = 300;


void setup() {
   size(600, 400);
   background(210, 215, 140);
   noFill();
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);

   line(50, TimeAxisY, 540, TimeAxisY);    // the time axis
   float targetX = 180;
   float threshold = 0.0001;
   float answerT = findTfromX(threshold, targetX);
   
   line(targetX, 0, targetX, TimeAxisY);
   float px = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], answerT);
   float py = curvePoint(Yp[0], Yp[1], Yp[2], Yp[3], answerT);
   ellipse(px, py, 20, 20);
}

float findTfromX(float threshold, float targetX) {
  float tlo = 0;
  float thi = 1;
  float xLeft = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], tlo);
  float xRight = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], thi);
  int numSteps = 500;
  while (numSteps-- > 0) {
     float tmid = (tlo + thi)/2.0;
     if ((thi - tlo) < threshold) {
        return(tmid);
     }
     float xval = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], tmid);
     if (targetX < xval) thi = tmid;
                    else tlo = tmid;
   }
   return((tlo+thi)/2.0);  // we couldn't find the point
}
