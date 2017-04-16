Disk Ghost0;
Disk Ghost1;

void setup() {
   size(600, 400);
   background(132, 144, 163);
   Ghost0 = new Disk(100, 100,  5,  5, 20, color(242, 203, 5));
   Ghost1 = new Disk(400, 200, -3, -7, 30, color(209, 117, 4));
}

void draw() {
   fill(Ghost0.clr);
   ellipse(Ghost0.xPos, Ghost0.yPos, Ghost0.radius*2, Ghost0.radius*2);
   fill(Ghost1.clr);
   ellipse(Ghost1.xPos, Ghost1.yPos, Ghost1.radius*2, Ghost1.radius*2);
}

class Disk {
   float xPos;   // 1. Current location (X and Y)
   float yPos;  
   float xDir;   // 2. Current motion (X and Y)
   float yDir;
   float radius; // 3. Radius
   color clr;    // 4. Color

   Disk (float axPos, float ayPos, float axDir,  float ayDir,
   float aradius, color aclr) {
      xPos   = axPos;
      yPos   = ayPos;
      xDir   = axDir;
      yDir   = ayDir;
      radius = aradius;
      clr    = aclr;
   }
}
