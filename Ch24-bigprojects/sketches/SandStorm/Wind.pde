// Wind class
// version 1.0 - AG 30 April 2009
//

class Wind {
   PVector center;    // center of the wind
   PVector velocity;  // speed of the wind itself across the screen
   PVector wind;      // direction of the wind
   float radius;      // radius of wind effect
   float strength;    // strength of the wind

   // create a new object with random values
   Wind() {
      center = new PVector(random(50, width-50), random(50, height-50));
      velocity= new PVector(random(-1, 1), random(-1, 1));
      wind= new PVector(random(-3, 3), random(-1, 1));
      radius = random(40, 220);
      strength = random(-5, 5);
   }

   // find the effect of this wind at this point
   PVector windAt(PVector p) {
      PVector windSum = new PVector(0, 0);  // by default, there's no effect
      float pointToWind = dist(p.x, p.y, center.x, center.y);
      if (pointToWind < radius) {
         // we're inside radius.  Find the strength from the distance
         // of this point to the center.
         float wstrength = map(pointToWind, 0, radius, strength, 0);
         // compute the line perpendicular to the line from
         // the center to this point; that's where the wind is pointing.
         PVector dPoint = new PVector(p.x-center.x, p.y-center.y);
         PVector windDir = new PVector(dPoint.y, -dPoint.x);
         // scale the wind based on its strength at this point
         windDir.normalize();
         windDir.mult(wstrength);
         windSum.add(windDir);
      }
      return(windSum);
   }

   // move the wind around on the screen like a bouncing ball
   void update() {
      center.add(velocity);
      if ((center.x < 0) || (center.x >= width)) {
         velocity.x = -velocity.x;
         center.x += 2*velocity.x;
      }
      if ((center.y < 0) || (center.y >= height)) {
         velocity.y = -velocity.y;
         center.y += 2*velocity.y;
      }
   }
}
