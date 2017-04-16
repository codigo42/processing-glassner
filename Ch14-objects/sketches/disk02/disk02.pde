Disk Ghost;

void setup() {
   size(600, 400);
   background(164, 164, 164);
   Ghost = new Disk(5);
   println("Ghost radius = "+Ghost.radius);
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
