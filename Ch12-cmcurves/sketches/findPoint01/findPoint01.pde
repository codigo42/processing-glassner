float [] Xp = {  50,  50, 540, 200 };
float [] Yp = {-650, 150, 110, -290 };

void setup() {
   size(600, 400);
   background(210, 215, 140);
   noFill();
   curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
}
