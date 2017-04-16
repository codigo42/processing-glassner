// Grain class
// version 1.0 - AG 30 April 2009
//

class Grain {
   PVector center;       // center location
   float radius;        // size in pixels
   float ch, cs, cb;    // color
   
   PVector oldVelocity;     // movement in last frame
   PVector oldCenter;    // position in last frame

   Grain() {
      fillGrain(true);
   }
  
   // Fill in the Grain with random values.  Pick a point above the
   // screen so that the Grain will take a while to fall.  This is
   // not very efficient!  Assign a color based on the Grain's
   // horizontal position.
   //
   void fillGrain(boolean firstFill) {
      center = new PVector(random(0, width), random(-height, 0));
      if (!firstFill) center.y = 0;
      oldCenter = new PVector(center.x, center.y);
      oldVelocity = new PVector(random(-.02,.02), random(.4, 1.8));
      radius = random(0.25, 2.0);

      float colorSets [] = {   // five hand-picked HSB colors I like
         35, 238, 133,
         42, 231, 210,
         21, 232, 235,
         18, 204, 115,
          9, 248, 210, };

      int colorSteps = int(colorSets.length/3)-1;
      float setWidth = 1.0*width/colorSteps;
      int setNumber = int(center.x/setWidth);
      float a = (center.x - (setNumber * setWidth))/setWidth;
      ch = lerp(colorSets[(setNumber*3)], colorSets[(setNumber*3)+3], a);
      cs = lerp(colorSets[(setNumber*3)+1], colorSets[(setNumber*3)+4], a);
      cb = lerp(colorSets[(setNumber*3)+2], colorSets[(setNumber*3)+5], a);
      
      ch = (ch + (frameCount * .02)) % 255.0;
      cs = constrain(cs+random(-10, 10), 0, 255);
      cb = constrain(cb+random(-10, 10), 0, 255); 
   }
  
   // draw this Grain as a short stroke from the oldCenter to center
   void render() {
      strokeWeight(radius);      
      colorMode(HSB);
      stroke(ch, cs, cb);
      line(oldCenter.x, oldCenter.y, center.x, center.y);
   }
   
   // update the Grain's position.  First, store where it is now into
   // oldCenter.  Take the velocity from the last update and scale it
   // to simulate drag due to the effects of atmosphere.  Add in
   // gravity.  Then add in the total contribution of all wind gusts.
   // move the Grain to the new position.  If it's fallen off the bottom
   // of the screen, recycle it by loading it with new random values.
   void move() {
      // save the current center
      oldCenter.x = center.x;
      oldCenter.y = center.y;

      // reduce the old velocity to account for atmospheric drag
      PVector newVelocity = new PVector(oldVelocity.x, oldVelocity.y);
      newVelocity.mult(.3);

      // start the new effect (in totalWind) with some gravity
      PVector totalWind = new PVector(0, random(1.5, 2.0));

      // add in the effects of each wind gust
      for (int i=0; i<Gusts.length; i++) {
         PVector w = Gusts[i].windAt(center);
         totalWind.add(w);
      }

      // add the new effect (in totalWind) to the old velocity,
      // giving a new velocity.  Add that to the center.
      newVelocity.add(totalWind);
      center.add(newVelocity);
      
      oldVelocity.x = newVelocity.x;
      oldVelocity.y = newVelocity.y;
      

      // if the Grain has fallen below the screen, recycle it.
      if (center.y > height) {
         fillGrain(false);
      }
   }
}
  
