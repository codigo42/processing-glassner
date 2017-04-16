void setup() {
   size(600, 400);
   background(242, 240, 174);
   noFill();
}

float [] Xp = { 100, 300, 300, 100 };
float [] Yp = { 100, 100, 300, 300 };

void draw() {
   for (int i=0; i<4; i++) {
      ellipse(Xp[i], Yp[i], 15, 15);
   }
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
}
