void setup() {
   size(600, 400);
   background(0);
   noFill();
   stroke(255);
}   

void draw() {
   if (frameCount > 75) return;
   float percent = map(frameCount, 0, 75, 0, 1);
   float v = percent;
   float centerx = lerp(100, 500, v);
   float centery = lerp(200, 100, sin(v * radians(180)));
   stroke(255, 255*v, 255*v);
   ellipse(centerx, centery, 75, 75);
}
