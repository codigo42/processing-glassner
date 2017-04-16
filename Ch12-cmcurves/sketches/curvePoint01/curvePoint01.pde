float [] Xp = {  40,  50, 540, 300 };
float [] Yp = { 940, 160, 200, 900 };

void setup() {
  size(600, 400);
  background(237, 180, 198);
  noFill();
  curve(Xp[0], Yp[0], Xp[1], Yp[1], Xp[2], Yp[2], Xp[3], Yp[3]);
}
