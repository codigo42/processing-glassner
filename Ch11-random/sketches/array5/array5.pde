void setup() {
   size(600, 400);
   background(2, 59, 71);
   fill(155, 226, 242);
   noStroke();
}

int [] Diameters = { 30, 50, 90, 20, 44, 76, 22, 30 };

void draw() {
   int xpos = 50;
   for (int i=0; i<8; i++) {
      ellipse(xpos, 100, Diameters[i], Diameters[i]);
      if (i < 7) {
         xpos += (Diameters[i]/2.0) + 20 + (Diameters[i+1]/2.0);
      }
   }
}
