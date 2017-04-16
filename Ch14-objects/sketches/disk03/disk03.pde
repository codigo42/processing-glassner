Disk Ghost0;
Disk Ghost1;

void setup() {
   size(600, 400);
   background(164, 164, 164);
   Ghost0 = new Disk(5);
   Ghost1 = new Disk(37);
   println("Ghost0 radius = "+Ghost0.radius);
   println("Ghost1 radius = "+Ghost1.radius);
}

void draw() {
   // draw something
}

class Disk {
   float xPos;   // 1. Current location (X and Y)
   float yPos;
   float xDir;   // 2. Current motion (X and Y)
   float yDir;
   float radius; // 3. Radius
   color clr;    // 4. Color

   Disk(float aradius) {
      radius = aradius;
   }
}
