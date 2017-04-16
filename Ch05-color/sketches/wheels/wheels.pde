float StartAngle = 0;
float AngleBump = 0;
color Color1 = color(180, 95, 10);
color Color2 = color(0, 80, 110);

void setup() {
   size(400, 400);
   smooth();
}

void draw() {
   background(Color2);
   noStroke();
   float radius = 400;
   int circleCount = 0;
   float angle = StartAngle;
   while (radius > 0) {
      fill(Color1);
      ellipse(200, 200, radius, radius);
      fill(Color2);
      arc(200, 200, radius, radius, angle, angle+PI);
      radius -= 30;
      angle += AngleBump;
   }
   StartAngle += .01;
   AngleBump += .005;
}
