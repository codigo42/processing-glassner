class Disk {
   PVector center;
   float radius;
   color clr;

   Disk(PVector acenter, float aradius, color aclr) {
      center = new PVector(acenter.x, acenter.y);
      radius = aradius;
      clr = aclr;
   }

   void render(boolean drawStroke, boolean drawFill) {
      noFill();
      noStroke();
      if (drawFill) fill(clr);
      if (drawStroke) stroke(clr);
      ellipse(center.x, center.y, 2*radius, 2*radius);
   }
}

void setup() {
   size(600, 600);
   background(0);
   smooth();
}
