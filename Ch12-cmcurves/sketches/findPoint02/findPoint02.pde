float [] Xp = {  50,  50, 540, 200 };
float [] Yp = {-650, 150, 110, -290 };
int TimeAxisY = 300;

void setup() {
   size(600, 400);
   background(210, 215, 140);
   noFill();
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);

   line(50, TimeAxisY, 540, TimeAxisY);    // the time axis
   drawMatch(color(194, 54, 17), 0.2);
   drawMatch(color(112, 52, 90), 0.5);
   drawMatch(color(40, 115, 110), 0.8);
}

void drawMatch(color clr, float percent) {
   stroke(clr);
   fill(255);
   
   float x3 = curvePoint(Xp[0], Xp[1], Xp[2], Xp[3], percent);
   float y3 = curvePoint(Yp[0], Yp[1], Yp[2], Yp[3], percent);
   ellipse(x3, y3, 20, 20);
   
   float px = lerp(50, 540, percent);
   line(px, 0, px, TimeAxisY);
}
