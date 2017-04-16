float Cx, Cy;           // ball center
float Vx, Vy;           // ball velocity
float Radius;           // ball radius

void setup() {
   size(600, 400);
   Cx = 300;
   Cy = 200;
   Radius = 30;
   Vx = 2;
   Vy = 3;
}

void draw() {
   Radius += random(-2.0, 2.0);
   Radius = constrain(Radius, 10, 50);

   Cx += Vx;
   Cy += Vy;
   if ((Cx-Radius < 0) || (Cx+Radius >= width)) {
      Vx = -Vx;
      Cx += 2 * Vx;
   }
   if ((Cy-Radius < 0) || (Cy+Radius >= height)) {
      Vy = -Vy;
      Cy += 2 * Vy;
   }
   
  // draw the ball
  //background(128, 103, 103);
  stroke(0);
  fill(224, 199, 37);
  ellipse(Cx, Cy, Radius*2, Radius*2);
}
