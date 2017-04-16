void setup() {
   size(600, 400);
   background(242, 240, 174);
   noFill();
}

float [] Xp = { 100, 300, 300, 100 };
float [] Yp = { 100, 100, 300, 300 };

void draw() {
   stroke(255, 0, 0);   // red
   ellipse(Xp[0], Yp[0], 15, 15);
   line(Xp[0], Yp[0], Xp[1], Yp[1]);
  
   stroke(0, 0, 255);   // blue
   ellipse(Xp[3], Yp[3], 15, 15);
   line(Xp[3], Yp[3], Xp[2], Yp[2]);

   stroke(0, 0, 0);   // black
   ellipse(Xp[1], Yp[1], 15, 15);
   ellipse(Xp[2], Yp[2], 15, 15);

   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
}
