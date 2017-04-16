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
        if (depth == 1) fill(color(89, 9, 21));
   else if (depth == 2) fill(color(148, 14, 35));
   else if (depth == 3) fill(color(181, 86, 70));
   else if (depth == 4) fill(color(199, 172, 115));
   else return;   

   ellipse(0, 0, 2, 2);
   scale(0.75);
   drawCircles(depth+1);
}
