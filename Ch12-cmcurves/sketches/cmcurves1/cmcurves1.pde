void setup() {
   size(600, 400);
   background(242, 240, 174);
   noFill();
}

void draw() {
   stroke(0);
   int x0 = 100;  int y0 = 100;
   int x1 = 300;  int y1 = 100;
   int x2 = 300;  int y2 = 300;
   int x3 = 100;  int y3 = 300;
   ellipse(x0, y0, 15, 15);
   ellipse(x1, y1, 15, 15);
   ellipse(x2, y2, 15, 15);
   ellipse(x3, y3, 15, 15);
   // and now do some curve drawing
}
