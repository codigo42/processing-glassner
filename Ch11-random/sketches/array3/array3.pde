void setup() {
   size(600, 400);
   background(2, 59, 71);
   fill(155, 226, 242);
   noStroke();
}

int [] Diameters = { 30, 50, 90, 20, 44, 76, 22, 30 };

void draw() {
   stroke(0);
   for (int i=0; i<8; i++) {
      ellipse(100, 100, Diameters[i], Diameters[i]);
   }
}
