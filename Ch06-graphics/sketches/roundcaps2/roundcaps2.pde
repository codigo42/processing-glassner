void setup() {
   size(600, 400);
   background(224);
   
   strokeCap(ROUND);
   doLine(100, 50, 300, 150, 500, 50);

   strokeCap(SQUARE);
   doLine(100, 150, 300, 250, 500, 150);
   
   strokeCap(PROJECT);
   doLine(100, 250, 300, 350, 500, 250);
}

void doLine(float x0, float y0, float x1, float y1, float x2, float y2) {
   stroke(0);
   strokeWeight(30);
   line(x0, y0, x1, y1);
   line(x1, y1, x2, y2);
   strokeWeight(2);
   stroke(222, 170, 146);  // red
   line(x0, y0, x1, y1);
   stroke(176, 217, 100);  // green
   line(x1, y1, x2, y2);
}
