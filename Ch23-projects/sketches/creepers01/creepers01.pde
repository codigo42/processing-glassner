
PGraphics LayerGroundMask;
PGraphics LayerGroundPicture;
PGraphics LayerGrass;
PGraphics LayerGrassShadow;

class Blade {

   color clr;
   PVector seed, seedA, seedB;
   PVector c1, c1A, c1B;
   PVector c2, c2A, c2B;
   PVector tip;
   float r0, r1, r2;

   // Blade grows from seed to tip.  pA and pB are along the way.
    // c1 and c2 are perpendiculars at pA and pB.  A and B values
   // are points above and below seed, c1, and c2 for blade thickness.
   //
   //                                 c2A
   //                   c1A      *****(c2)**
   //                 **(c1)*****     c2B   **
   //               **  c1B            |      **
   //      sA     **     |             |        **
   //    (seed)***------(pA)----------(pB)--------***(tip)
   //      sB
   //

   Blade() {
      color color0 = color(109, 204,  55, 192);  // greenish
      color color1  = color(  9, 178, 150, 192); // blueish
      clr = lerpColor(color0, color1, random(0, 1));
      seed = new PVector(0, 0);
      tip = new PVector(0, 0);
   }

   void plantSeed(PGraphics mask) {
      boolean foundSeed = false;
      while (!foundSeed) {
         seed.x = random(0, width);
         seed.y = random(0, height);
         int maskx = round(seed.x);
         int masky = round(seed.y);
         float rval = red(mask.get(maskx, masky));
         if (rval < 1) foundSeed = true;
      }
   }

   void buildBlade(PGraphics layer) {
      float minLength = layer.width/20;
      float maxLength = layer.width/5;
      float bladeLength = lerp(minLength, maxLength, pow(random(0,1), 3));

      float bladeAngle = random(0, TWO_PI);
      tip = new PVector(seed.x + (bladeLength * cos(bladeAngle)),
                          seed.y + (bladeLength * sin(bladeAngle)));
   
      float aPercent = random(0.2, 0.4);
      float bPercent = random(0.6, 0.8);
      PVector pA = new PVector(lerp(seed.x, tip.x, aPercent), lerp(seed.y, tip.y, aPercent));
      PVector pB = new PVector(lerp(seed.x, tip.x, bPercent), lerp(seed.y, tip.y, bPercent));
   
      PVector tipMinusSeed = new PVector(tip.x-seed.x, tip.y-seed.y);
      PVector perp = new PVector(-tipMinusSeed.y, tipMinusSeed.x); // counter-clockwise
      perp.normalize();
   
      float c1sign = 1;
      if (random(1000) > 500) c1sign = -1;
      float c2sign = 1;
      if (random(1000) > 500) c2sign = -1;

      c1 = new PVector(pA.x + (c1sign*((aPercent*bladeLength)*perp.x)), 
                    pA.y + (c1sign*((aPercent*bladeLength)*perp.y)));
      c2 = new PVector(pB.x - (c2sign*(((1-bPercent)*bladeLength)*perp.x)), 
                           pB.y - (c2sign*(((1-bPercent)*bladeLength)*perp.y)));

   
      r0 = bladeLength * random(.01, .04);
      r1 = r0 * random(.5, .75);
      r2 = r1 * random(.5, .75);
   
      PVector c1MinusSeed = new PVector(c1.x-seed.x, c1.y-seed.y);
      PVector c1MSperp = new PVector(-c1MinusSeed.y, c1MinusSeed.x);
      c1MSperp.normalize();
      seedA = new PVector(seed.x+(r0*c1MSperp.x), seed.y+(r0*c1MSperp.y));
      seedB = new PVector(seed.x-(r0*c1MSperp.x), seed.y-(r0*c1MSperp.y));
      c1A = new PVector(c1.x+(r1*c1MSperp.x), c1.y+(r1*c1MSperp.y));
      c1B = new PVector(c1.x-(r1*c1MSperp.x), c1.y-(r1*c1MSperp.y));
   
      PVector tipMinusC2 = new PVector(tip.x-c2.x, tip.y-c2.y);
      PVector tMC2perp = new PVector(-tipMinusC2.y, tipMinusC2.x);
      tMC2perp.normalize();
      c2A = new PVector(c2.x+(r2*tMC2perp.x), c2.y+(r2*tMC2perp.y));
      c2B = new PVector(c2.x-(r2*tMC2perp.x), c2.y-(r2*tMC2perp.y));
   }
   
   void renderVein(PGraphics layer) {
      layer.beginDraw();
      layer.noFill();
      layer.stroke(clr);
      layer.bezier(seed.x, seed.y, c1.x, c1.y, c2.x, c2.y, tip.x, tip.y);
      layer.endDraw();
   }

   void renderBlade(PGraphics layer) {
      layer.smooth();
      layer.beginDraw();

      layer.noFill();
      layer.stroke(0, 16);
      layer.strokeWeight(5);
      drawCurves(layer);

      layer.noStroke();
      layer.fill(clr);
      drawCurves(layer);
      layer.ellipse(seed.x, seed.y, r0, r0);

      layer.endDraw();
   }

   void drawCurves(PGraphics layer) {
      layer.beginShape();
      layer.vertex(seedA.x, seedA.y);
      layer.bezierVertex(c1A.x, c1A.y, c2A.x, c2A.y, tip.x, tip.y);
      layer.bezierVertex(c2B.x, c2B.y, c1B.x, c1B.y, seedB.x, seedB.y);
      layer.endShape(CLOSE);
   }
}

void setup() {
   size(600, 600, JAVA2D);
   smooth();
   background(69, 51, 40);

   LayerGroundMask    = createGraphics(width, height, JAVA2D);
   LayerGroundPicture = createGraphics(width, height, JAVA2D);
   LayerGrass         = createGraphics(width, height, JAVA2D);
   LayerGrassShadow   = createGraphics(width, height, JAVA2D);

   buildGround();
   growGrass();
   makeGrassShadow();

   image(LayerGroundPicture, 0, 0);
   image(LayerGrassShadow, 0, 0);
   image(LayerGrass, 0, 0);
}

void buildGround() {
   LayerGroundMask.beginDraw();
   LayerGroundMask.background(255);
   for (int y=0; y<LayerGroundMask.height; y++) {
      for (int x=0; x<LayerGroundMask.width; x++) {
         if (noise(x*.02, y*.02) > 0.7) LayerGroundMask.set(x, y, color(0));
      }
   }
   LayerGroundMask.endDraw();

   color c0 = color(65, 65, 65);
   color c1 = color(128, 128, 128);

   PImage concreteImage = loadImage("ground600.png");

   LayerGroundPicture.beginDraw();
   for (int y=0; y<LayerGroundPicture.height; y++) {
      for (int x=0; x<LayerGroundPicture.height; x++) {
         float opacity = (red(LayerGroundMask.get(x,y)) == 0) ? 0 : 255;
         float a = noise(x*.02, y*.02);
         color clr = color(
            lerp(red(c0), red(c1), a), 
            lerp(green(c0), green(c1), a), 
            lerp(blue(c0), blue(c1), a), 
            opacity);

         color concreteColor = concreteImage.get(x,y);
         float ablend = 0.20;
         color cnew = color(red(concreteColor), green(concreteColor), blue(concreteColor), opacity);
         color blendColor = lerpColor(clr, cnew, ablend);

         LayerGroundPicture.set(x, y, blendColor);
      }
   }
   LayerGroundPicture.endDraw();
}


void growGrass() {
   LayerGrass.background(0, 0);
   for (int g=0; g<1000; g++) {
      Blade blade = new Blade();
      blade.plantSeed(LayerGroundMask);
      blade.buildBlade(LayerGrass);
      blade.renderBlade(LayerGrass);
   }
}

void makeGrassShadow() {
   float blurLayerSrc[][] = new float[height][width];
   float blurLayerDst[][] = new float[height][width];
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         blurLayerSrc[y][x] = 0;
         color clr = LayerGrass.get(x,y);
         if (alpha(clr) > 0) blurLayerSrc[y][x] = 1;
      }
   }

   int numPasses = 3;
   int blurRadius = 8;
   for (int pass=0; pass<numPasses; pass++) {
      // blur src into dst
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            int numAdded = 0;
            float blurSum = 0;
            int ixlo = max(0, x-blurRadius);
            int ixhi = min(width, x+blurRadius);
            int iylo = max(0, y-blurRadius);
            int iyhi = min(height, y+blurRadius);
            for (int iy=iylo; iy<iyhi; iy++) {
               for (int ix=ixlo; ix<ixhi; ix++) {
                  numAdded++;
                  blurSum += blurLayerSrc[iy][ix];
               }
            }
            if (numAdded == 0) numAdded = 1;
            blurLayerDst[y][x] = blurSum/numAdded;
         }
      }

      // copy dst into src
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            blurLayerSrc[y][x] = blurLayerDst[y][x];
         }
      }
   }

   // copy src into the layer
   LayerGrassShadow.beginDraw();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float opacity = 96 * blurLayerSrc[y][x];
         LayerGrassShadow.set(x, y, color(0, 0, 0, opacity));
      }
   }
   LayerGrassShadow.endDraw();
}
