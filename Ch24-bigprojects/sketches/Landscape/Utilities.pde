
// A little convenience procedure to return a
// random number from (center-distance) to (center+distance)
//
float wiggle(float center, float distance) {
   float offset = random(-distance, distance);
   return(center+offset);
}
    
// Fake distance perspective.  The object color is lerped into the
// background color by an amount given by depth.  When depth=0,
// the object is touching our nose and the color is unaffected.
// When depth=100, the object blends completely into the background.
// In between the blend is exponential, meant to sorta fake reality.
//
color distanceContrast(color objectColor, color bgColor, float depth) {
   float expAt1 = 2.71828;   // Euler's constant, exp(1)
   float a = map(exp(depth/100.0), 1, expAt1, 0, 1);
   a = constrain(a, 0, 1);
   color newclr = lerpColor(objectColor, bgColor, a);
   return(newclr);
}
