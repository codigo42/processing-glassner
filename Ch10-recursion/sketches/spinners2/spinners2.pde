int MaxDepth = 4;

void setup() {
   size(500, 500);
   noStroke();
}

void draw() {
   background(119, 112, 127);
   translate(250, 250);
   scale(240.0);
   drawCircles(1);
}

void drawCircles(int depth) {
   if (depth > MaxDepth) return;
   fill(89, 9, 21);
   ellipse(0, 0, 2, 2);
   scale(0.75);
   drawCircles(depth+1);
}
