void setup() {
   size(600, 400);
   background(0);
   noFill();
   stroke(255);
   line(0, 237, 600, 237);
}   

void draw() {
   float percent = map(frameCount, 0, 75, 0, 1);
   float v = exp(-4*percent*percent);
   v = map(v, 1, exp(-4), 1, 0);
   if (frameCount > 75) v = 0;
   float w = 1-v;
   float centerx = lerp(100, 500, w);
   float centery = lerp(200, 100, sin(w * radians(180)));
   stroke(255, 255*w, 255*w);
   ellipse(centerx, centery, 75, 75);
}
