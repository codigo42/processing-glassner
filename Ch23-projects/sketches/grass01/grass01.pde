boolean GrowMap[][];        // true if we can grow at that x,y
float GrowThreshold = 0.7;  // grow in land over this value

void setup() {
   size(600, 400);
   createGround();
   noStroke();
}

void draw() {
   int bladesPerFrame = 10;
   for (int i=0; i<bladesPerFrame; i++) {
      drawOneBlade();
   }
}

// draw the dirty ground and initialize the grow map
void createGround() {
   GrowMap = new boolean[height][width];
   background(0, 0, 0);
   color darkBrown = color(23, 7, 7);
   color lightBrown = color(82, 41, 33);
   loadPixels();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (!GrowMap[y][x]) {
            float t = noise(x*.025, y*.025);
            if (t > GrowThreshold) {
               GrowMap[y][x] = true;
               pixels[(y*width)+x] = color(0);
            } else {
               GrowMap[y][x] = false;
               float a = norm(t, 0, GrowThreshold);
               color pColor = lerpColor(darkBrown, lightBrown, a);
               pixels[(y*width)+x] = pColor;
            } 
         }
      }
   }
   updatePixels();
}

void drawOneBlade() {
   color greenish = color(109, 204,  55, 32);
   color blueish  = color(  9, 178, 150, 32);
   PVector seed = new PVector(0, 0);

   // find a place to start this blade
   boolean foundSeed = false;
   while (!foundSeed) {
      seed.x = int(random(0, width));
      seed.y = int(random(0, height));
      if (GrowMap[int(seed.y)][int(seed.x)]) foundSeed = true;
   }

	float blerp = random(0,1);
	float bladeLength = random(width/20, width/5);
	float bladeAngle = random(0, TWO_PI);
	PVector tip = new PVector(seed.x + (bladeLength * cos(bladeAngle)),
							  seed.y + (bladeLength * sin(bladeAngle)));


   // find points pA and pB along the length of the blade
   float aPercent = random(0.2, 0.4);
   float bPercent = random(0.6, 0.8);
   PVector pA = new PVector(lerp(seed.x, tip.x, aPercent), lerp(seed.y, tip.y, aPercent));
   PVector pB = new PVector(lerp(seed.x, tip.x, bPercent), lerp(seed.y, tip.y, bPercent));

   // find the vector perpendicular to the blade
   PVector tipMinusSeed = new PVector(tip.x-seed.x, tip.y-seed.y);
   PVector perp = new PVector(-tipMinusSeed.y, tipMinusSeed.x); // counter-clockwise
   if (random(1000) > 500) { perp.x *= -1;  perp.y *= -1; }     // clockwise
   perp.normalize();

   // add some of that perpendicular to pA and pB to get c1 and c2
   PVector c1 = new PVector(pA.x+((aPercent*bladeLength)*perp.x), 
                            pA.y+((aPercent*bladeLength)*perp.y));

   PVector c2 = new PVector(pB.x-(((1-bPercent)*bladeLength)*perp.x), 
                            pB.y-(((1-bPercent)*bladeLength)*perp.y));

   // pick a color and draw the blade
   color clr = lerpColor(greenish, blueish, random(0, 1));

   noFill();
   stroke(clr);
   bezier(seed.x, seed.y, c1.x, c1.y, c2.x, c2.y, tip.x, tip.y);
}
