
color EarthColor = color(0, 200, 200, 200);
color MoonColor = color(0, 200, 0, 200);
color ShipColor = color(200, 0, 0, 200);
color PortholeColor = color(0, 200, 200, 200);
color Blast1Color = color(200, 200, 0, 200);
color Blast2Color = color(200, 128, 0, 200);
color NeonColor;

PGraphics GlowLayer;
PGraphics TubeLayer;
PGraphics CoreLayer;

PGraphics Layer;  // the current drawing layer
int PassNumber;   // three passes per graphic: glow, tube, core

PImage Background;

// These arrays are used to blur an image.  I'm making them
// globals so I don't have to reallocate them for every blur.
color [][] BlurSrc;   
color [][] BlurDst;

void setup() {
   size(415, 250, JAVA2D);
   GlowLayer = createGraphics(width, height, JAVA2D);
   TubeLayer = createGraphics(width, height, JAVA2D);
   CoreLayer = createGraphics(width, height, JAVA2D);
   Background = loadImage("rust.jpg");

   BlurSrc = new color[height][width];
   BlurDst = new color[height][width];
}

void draw() {
   initLayers();
   int frameNumber = (millis() / 1000) % 5;  // display each image for 1 second

   for (PassNumber=0; PassNumber<3; PassNumber++) {
      switch (PassNumber) {
         case 0: Layer = GlowLayer;  Layer.strokeWeight(24);  break;
         case 1: Layer = TubeLayer;  Layer.strokeWeight( 7);  break;
         case 2: Layer = CoreLayer;  Layer.strokeWeight( 2);  break;
         default: break;
      }

      drawPlanets();
      drawFrame(frameNumber);
   }
   showLayers();
}

// all layers start out black and transparent
void initLayers() {
   GlowLayer.beginDraw();
   GlowLayer.noFill();
   GlowLayer.smooth();
   GlowLayer.background(0, 0, 0, 0);
   GlowLayer.endDraw();

   TubeLayer.beginDraw();
   TubeLayer.noFill();
   TubeLayer.smooth();
   TubeLayer.background(0, 0, 0, 0);
   TubeLayer.endDraw();

   CoreLayer.beginDraw();
   CoreLayer.noFill();
   CoreLayer.smooth();
   CoreLayer.background(0, 0, 0, 0);
   CoreLayer.endDraw();
}

void showLayers() {
   image(Background, 0, 0);

   blurLayer(GlowLayer, 1, 5, 0.5, 0.5);
   blend(GlowLayer, 0, 0, width, height, 0, 0, width, height, ADD);

   blurLayer(TubeLayer, 1, 3, 1.0, 0.75);
   blend(TubeLayer, 0, 0, width, height, 0, 0, width, height, ADD);

   blend(CoreLayer, 0, 0, width, height, 0, 0, width, height, ADD);
}

void drawPlanets() {
   setNeonColor(EarthColor);
   drawNeonEllipse(62, 165, 80, 80);  // earth
   setNeonColor(MoonColor);
   drawNeonEllipse(365, 150, 40, 40);  // moon
}

void drawFrame(int frameNumber) {
   boolean blast1 = false;
   boolean blast2 = false;
   float angle = 0;
   float tx = 0;
   float ty = 0;
   switch (frameNumber) {
      case 0: tx =  82; ty = 175; break;
      case 1: tx =  92; ty = 120; angle =  50; blast1 = true; break;
      case 2: tx = 140; ty =  72; angle =  80; break;
      case 3: tx = 362; ty =  92; angle = -50; blast2 = true; break;
      case 4: tx = 385; ty = 180; break;
      default: break;
   }
   drawShip(tx, ty, angle, blast1, blast2);
}

// draw ship with origin between the bottom fin tips
// it has height 65 and width 40
void drawShip(float tx, float ty, float angle, boolean blast1, boolean blast2) {
   Layer.pushMatrix();
   Layer.translate(tx, ty);
   Layer.rotate(radians(angle));
   Layer.translate(-40, -110);

   setNeonColor(ShipColor);
   mirrorY(20,   0, 12,   7,  8,  11,  8,  25); // body upper
   mirrorY( 8,  25,  8,  36,  8,  50,  8,  55); // body lower
   mirrorY( 8,  55, 10,  49, 15,  45, 20,  45); // body base
   mirrorY( 8,  35,  4,  35,  0,  35,  0,  42); // fin upper
   mirrorY( 0,  42,  0,  50,  0,  50,  0,  55); // fin lower
   mirrorY( 0,  55,  2,  48,  5,  45,  8,  45); // fin inside

   setNeonColor(PortholeColor);
   drawNeonEllipse(20, 18, 10, 10);

   if (blast1) {
      setNeonColor(Blast1Color);
      drawNeonLine(13, 55,  8,  75);
      drawNeonLine(18, 57, 17,  83);
      drawNeonLine(22, 60, 25,  72);
      drawNeonLine(25, 52, 32,  70);
   }
   if (blast2) {
      setNeonColor(Blast2Color);
      drawNeonLine(13, 53,  8, 70);
      drawNeonLine(18, 48, 14, 80);
      drawNeonLine(22, 55, 22, 74);
      drawNeonLine(25, 52, 30, 68);
   }
   Layer.popMatrix();
}

void mirrorY(float x0, float y0, float x1, float y1,
             float x2, float y2, float x3, float y3) {
   drawNeonBezier(x0, y0, x1, y1, x2, y2, x3, y3);
   drawNeonBezier(40-x0, y0, 40-x1, y1, 40-x2, y2, 40-x3, y3);
}

void setNeonColor(color clr) {
   NeonColor = clr;
   if (PassNumber == 2) NeonColor = color(255, 255, 255, 255);
   Layer.stroke(NeonColor);
}

void drawNeonBezier(float x0, float y0, float x1, float y1,
                    float x2, float y2, float x3, float y3) {
   Layer.bezier(x0, y0, x1, y1, x2, y2, x3, y3);
}


void drawNeonEllipse(float x, float y, float r0, float r1) {
   Layer.arc(x, y, r0, r1, radians(0), radians(350));  // leave a little gap like real neon signs
}

void drawNeonLine(float x0, float y0, float x1, float y1) {
   Layer.line(x0, y0, x1, y1);
}

// Blur the layer using a box average of the given radius.  Run the
// blur once for each pass.  When done, scale the output colors by
// the value in clrScale, and opacities by alphaScale
//
void blurLayer(PGraphics layer, int numPasses, int blurRadius, float clrScale, float alphaScale) {
   layer.loadPixels();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         BlurSrc[y][x] = layer.pixels[(y*width)+x];
      }
   }

   // blur the image in BlurSrc and save that in BlurDst
   for (int pass=0; pass<numPasses; pass++) {
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            int count = 0;
            float rSum = 0;
            float gSum = 0;
            float bSum = 0;
            float aSum = 0;
            int ixlo = max(0, x-blurRadius);
            int ixhi = min(width, x+blurRadius);
            int iylo = max(0, y-blurRadius);
            int iyhi = min(height, y+blurRadius);
            for (int iy=iylo; iy<iyhi; iy++) {
               for (int ix=ixlo; ix<ixhi; ix++) {
                  count++;
                  color srcColor = BlurSrc[iy][ix];
                  rSum += red(srcColor);
                  gSum += green(srcColor);
                  bSum += blue(srcColor);
                  aSum += alpha(srcColor);
               }
            }
            if (count == 0) count = 1;
            BlurDst[y][x] = color(rSum/count, gSum/count, bSum/count, aSum/count);
         }
      }

      // copy dst into src
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            BlurSrc[y][x] = BlurDst[y][x];
         }
      }
   }

   // copy src back to the layer, with scaling on colors and alpha
   layer.beginDraw();
   layer.loadPixels();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         color clr = BlurSrc[y][x];
         layer.pixels[(y*width)+x] = color(red(clr)*clrScale,
                                           green(clr)*clrScale,
                                           blue(clr)*clrScale,
                                           alpha(clr)*alphaScale);
      }
   }
   layer.updatePixels();
   layer.endDraw();
}

