
class Snow {
   color topColor; 
   color baseColor;
   float shadowNoiseStrength; 
   float glowHeight;
   color hazeColor; 
   float yValue; 
   float hillSize;
   float depth;
   PVector[] pts;

   Snow(color atopColor, color abaseColor, float ashadowNoiseStrength, 
        float aglowHeight, color ahazeColor, float ayValue, 
        float ahillSize, float adepth) {
      topColor = atopColor; 
      baseColor = abaseColor; 
      shadowNoiseStrength = ashadowNoiseStrength; 
      glowHeight = aglowHeight;
      hazeColor = ahazeColor; 
      yValue = ayValue; 
      hillSize = ahillSize; 
      depth = adepth;
      pts = new PVector[7];
   }

   void render() {
      // create two Bezier curves across the screen to create a rolling snowbank
      for (int i=0; i<7; i++) {
         pts[i] = new PVector(0, 0);
         pts[i].x = map(i, 0, 6, 0, width);
         pts[i].y = yValue + wiggle(0, hillSize);
         if ((i>0) && (i<6)) pts[i].x += wiggle(0, width/15.0);
      }
      pts[4].x = pts[3].x + (pts[3].x - pts[2].x); // make the curves join smooothly  
      pts[4].y = pts[3].y + (pts[3].y - pts[2].y); // by setting pts(4-3) = pts(3-2)
     
      // create a big filled region the top color of this snowbank
      noStroke();
      color topColorInDistance = distanceContrast(topColor, hazeColor, depth);
      fill(topColorInDistance);
      beginShape();
      vertex(0, height);
      vertex(pts[0].x, pts[0].y);
      bezierVertex(pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y);
      bezierVertex(pts[4].x, pts[4].y, pts[5].x, pts[5].y, pts[6].x, pts[6].y);
      vertex(width, height);
      endShape(CLOSE);
       
      // For each column of pixels, leave a few topColor pixels at the top,
      // then blend downward over the distance glowHeight to a combination 
      // of baseColor and shadow noise.

      loadPixels();
      for (int x=0; x<width; x++) {
         float gh = getHillHeightAtX(x)+3;  // get curve y, add 3 to skip smoothing
         for (int y=int(gh); y<height; y++) {
            float a = constrain((y-gh)/glowHeight, 0, 1); // amount in transition
            a = sin(radians(90.0 * a));                   // shape transition with sine

            float shadowNoise = noise((0.02*x)+width, (0.02*y)+height+yValue);  
            shadowNoise = shadowNoiseStrength * map(shadowNoise, 0.0, 1.0, -1.0, 1.0);       
            // blend top color to (bottom and shadow)
            float rval = lerp(red(topColor), red(baseColor)+shadowNoise, a);
            float gval = lerp(green(topColor), green(baseColor)+shadowNoise, a);
            float bval = lerp(blue(topColor), blue(baseColor)+shadowNoise, a);

            color clr = color(rval, gval, bval);          
      		clr = distanceContrast(clr, hazeColor, depth);
            pixels[(y*width)+x] = clr;              
         }
      }
      updatePixels();
   }

   // Find the height of a snowbank at a given x.  First find which of the two
   // Bezier curves we want, then use those points for the actual work.
   // Test to see if we're left or right of the rightmost point of the left curve.
   //
   float getHillHeightAtX(float x) {
      PVector [] bpts = new PVector[4];
      int inputOffset = 0;
      if (x > pts[3].x) inputOffset = 3;  
      for (int i=0; i<4; i++) {
         bpts[i] = new PVector(pts[i+inputOffset].x, pts[i+inputOffset].y);
      }
      return(getBezYforX(x, bpts));
   }
     
   // Assuming a Bezier curve that has just a single y value for each x, find the 
   // value of t that lands us at that x, and return the y value for that t.
   // Simply put, return the y value for the given x.
   //
   float getBezYforX(float x, PVector [] bpts) {
      float tLo = 0.0;
      float tHi = 1.0;
      float threshold = 0.0001; // if we get back a t within 1/10,000, good enough
      int numIterations = 500;  // we'll only try this many times
      while (numIterations-- > 0) {
         float tMid = (tLo+tHi)/2.0;
         float bx = bezierPoint(bpts[0].x, bpts[1].x, bpts[2].x, bpts[3].x, tMid);
         if (abs(bx-x) < threshold) {
            float by = bezierPoint(bpts[0].y, bpts[1].y, bpts[2].y, bpts[3].y, tMid);
            return(by);
         }
         if (bx > x) tHi = tMid;
                else tLo = tMid;
      }
      return((tLo+tHi)/2.0);
   }
}
