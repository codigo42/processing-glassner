float [] Xp = {  50,  50, 540, 200 };
float [] Yp = {-650, 150, 110, -290 };
int TimeAxisY = 300;
float Tlo = 0.0;
float Thi = 1.0;

void setup() {
   size(600, 400);
   background(210, 215, 140);
   noFill();
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);

   line(50, TimeAxisY, 540, TimeAxisY);    // the time axis
   float targetX = 120;
   for (int step=0; step<10; step++) {
      refineInterval(step, targetX);
      println("step "+step+":  Tlo = "+Tlo+"  Thi = "+Thi+"  (width = "+(Thi-Tlo)+")");
   } 
   
   line(targetX, 0, targetX, TimeAxisY);
   float tmid = (Tlo+Thi)/2.0;
   float px = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], tmid);
   float py = curvePoint(Yp[0], Yp[1], Yp[2], Yp[3], tmid);
   ellipse(px, py, 20, 20);
}

void refineInterval(int step, float targetX) {
  float xLeft = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], Tlo);
  float xRight = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], Thi);
  float barY = TimeAxisY - ((step+1)*10);
  line(xLeft, barY, xRight, barY); 
  
  float tmid = (Tlo + Thi)/2.0;
  float xval = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], tmid);
  if (targetX < xval) Thi = tmid;
                 else Tlo = tmid;
}
