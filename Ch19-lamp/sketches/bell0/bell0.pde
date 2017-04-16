void setup() {
   size(600, 400);
   background(0);
   noFill();
   stroke(255);
}   

void draw() {
   if (frameCount > 75) return;
   float centerx = map(frameCount, 0, 75, 100, 500);
   ellipse(centerx, 200, 75, 75);
}
