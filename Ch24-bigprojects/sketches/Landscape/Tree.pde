
class Tree {

   float sunX; 
   float sunY; 
   color hazeColor;
   float baseX; 
   float baseY; 
   float depth; 
   float treeHeight;  
   float trunkWidth; 
   color trunkColor;
   float puffRadius; 
   float puffDensity; 
   color puffColor; 
   color highlightColor;

 Tree(float asunX, float asunY, color ahazeColor,
      float abaseX, float abaseY, float adepth, float atreeHeight,
      float atrunkWidth, color atrunkColor,
      float apuffRadius, float apuffDensity, color apuffColor, color ahighlightColor) {
      sunX = asunX;
      sunY = asunY; 
      hazeColor = ahazeColor;
      baseX = abaseX; 
      baseY = abaseY; 
      depth = adepth; 
      treeHeight = atreeHeight;  
      trunkWidth = atrunkWidth; 
      trunkColor = atrunkColor;
      puffRadius = apuffRadius; 
      puffDensity = apuffDensity; 
      puffColor = apuffColor; 
      highlightColor = ahighlightColor;
   }

   void render() {

      // find the top of the tree, allowing it to tilt a little
      float topX = baseX;
      float topY = baseY - treeHeight;
      baseX += wiggle(0, treeHeight/10.0); 
   
      // make a Bezier curve for the trunk
      PVector p0 = new PVector(baseX, baseY);
      PVector p1 = new PVector(lerp(baseX, topX, 0.3), lerp(baseY, topY, 0.3));
      PVector p2 = new PVector(lerp(baseX, topX, 0.6), lerp(baseY, topY, 0.6));
      PVector p3 = new PVector(topX, topY);
      // wiggle the control points left and right so the trunk is curvy
      p1.x += 0.2 * treeHeight * wiggle(0, 1);
      p2.x += 0.2 * treeHeight * wiggle(0, 1);
      
      // draw the trunk with the given width, and color adjusted for distance
      trunkColor = distanceContrast(trunkColor, hazeColor, depth);
      noFill();
      stroke(trunkColor);
      strokeWeight(trunkWidth);
      bezier(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
      strokeWeight(1);
     
      // number of dots is puffball area (pi*radius*radius) times the density
      int numDots = int(puffRadius * puffRadius * PI * puffDensity);
   
      // find the point on the outer edge of the puff that's nearest the sun
      PVector spark = new PVector(sunX-topX, sunY-topY);
      spark.normalize();
      spark.mult(puffRadius);
      spark.add(new PVector(topX, topY));
   
      for (int p=0; p<numDots; p++) {
   
         // get a distance and angle for this dot, then find its (x,y)
         float thisR = getPuffR(puffRadius);
         float thisT = random(0.0, 360.0);
         float px = topX + (thisR * cos(thisT));
         float py = topY + (thisR * sin(thisT));
      
         // get distance to puff's spark (the source of highlight)
         float d2 = dist(px, py, spark.x, spark.y);
   
         // find highlight strength based on distance from spark
         float hlPower = constrain(map(d2, 0, puffRadius*1.25, 0, 1), 0, 1);
         
         // find the color, and add some noisy variation for effect
         float clrWiggle = 40.0;
         float rval = lerp(red(highlightColor), red(puffColor), hlPower) 
                       + wiggle(0, clrWiggle);
         float gval = lerp(green(highlightColor), green(puffColor), hlPower) 
                       + wiggle(0, clrWiggle);
         float bval = lerp(blue(highlightColor), blue(puffColor), hlPower) 
                       + wiggle(0, clrWiggle);

         // puffball fades out in the outermost 20 percent
         float aval = 255;
         float dimRadius = puffRadius * .8;
         if (thisR > dimRadius) {
            aval = map(thisR, puffRadius*.8, puffRadius, 255, 0);  
         }
   
         // build the color, adjust it for distance, and draw the dot
         color clr = color(rval, gval, bval, aval);
         clr = distanceContrast(clr, hazeColor, depth);
         stroke(clr);
         point(px, py);
      }
   }

   // A little hack to make a puffball shape that I find pleasing.  Then 
   // frequency of dots is given by the square root of the first 90 degrees
   // of the cosine curve.  There's no theory here; I just fooled around
   // with different patterns and liked this one the best.
   //
   float getPuffR(float puffRadius) {
      float x = 0;
      float y = 0;
      float thresh = 0;
      while (true) {
         x = random(0, 1);
         y = random(0, 1);
         thresh = cos(radians(x*90));
         thresh = sqrt(thresh);
         if (y < thresh) return(x*puffRadius);
      } 
   }
}
