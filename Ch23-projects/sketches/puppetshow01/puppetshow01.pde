
int NumLayers = 4;
PGraphics LayerImage[];
PGraphics LayerShadow[];
float MotionRadius = 10;

// starry sky: http://www.sxc.hu/photo/1005288
// mooon: http://www.sxc.hu/photo/1115121
PImage Background;

void setup() {
   size(600, 400, JAVA2D);
   LayerImage = new PGraphics[NumLayers];
   LayerShadow = new PGraphics[NumLayers];

   Background = loadImage("nightbg01.png");

   for (int layer=0; layer<NumLayers; layer++) {
      makeLayer(layer);
   }
}

void draw() {
   image(Background, 0, 0);
   for (int layer=0; layer<NumLayers; layer++) {
      int distanceFromBack = (NumLayers-1)-layer;
      float angleAtBack = 2.5 * frameCount;
      float theta = radians(angleAtBack) + (1.3 * layer);
      float radius = MotionRadius * pow(.8, distanceFromBack);
      float xoff = radius * cos(theta);
      float yoff = (layer * 20) + (radius * abs(sin(theta)));
      image(LayerShadow[layer], (-MotionRadius)+xoff, (-MotionRadius)+yoff);
      image(LayerImage[layer], (-MotionRadius)+xoff, (-MotionRadius)+yoff);
   }
}

void makeLayer(int layer) {
   int layerWidth = round(width + (2.5*MotionRadius));
   int layerHeight = round(height + (2.5*MotionRadius));

   PGraphics thisMask = createGraphics(layerWidth, layerHeight, JAVA2D);
   LayerShadow[layer] = createGraphics(layerWidth, layerHeight, JAVA2D);
   LayerImage[layer] = createGraphics(layerWidth, layerHeight, JAVA2D);
   
   // create the mask.  0=transparent, 255=opaque
   thisMask.beginDraw();
   thisMask.background(0, 255); // start completely opaque
   thisMask.smooth();
   thisMask.noStroke();
   thisMask.fill(255, 255);     // draw = erase opacity

   float circleYLine = layerHeight * 0.6;
   thisMask.rect(0, 0, layerWidth, circleYLine);

   float minRadius = layerHeight/10.0;
   float maxRadius = layerHeight/7.0;
   float radius = random(minRadius, maxRadius);
   float xCenter = -random(0, radius);
   while (xCenter-radius < layerWidth) {
      float yCenter = circleYLine + ((radius/4.0) *lerp(-1, 1, random(0,1)));
      thisMask.ellipse(xCenter, yCenter, radius*2, radius*2);
      xCenter += radius;
      radius = random(minRadius, maxRadius);
      xCenter += random(.25, .9)*radius;
   }
   thisMask.endDraw();

   // create the shadow: black with alpha
   // the float array is 1 for black (shadow), else 0
   float blurSrc[][] = new float[layerHeight][layerWidth];
   float blurDst[][] = new float[layerHeight][layerWidth];
   for (int y=0; y<layerHeight; y++) {
      for (int x=0; x<layerWidth; x++) {
         color c = thisMask.get(x, y);
         blurSrc[y][x] = red(c)/255.0;
      }
   }

   int numPasses = 1;
   int blurRadius = 8;
   for (int pass=0; pass<numPasses; pass++) {

      for (int y=0; y<layerHeight; y++) {
         for (int x=0; x<layerWidth; x++) {
            int ixlo = max(0, x-blurRadius);
            int ixhi = min(layerWidth, x+blurRadius);
            int iylo = max(0, y-blurRadius);
            int iyhi = min(layerHeight, y+blurRadius);
            int numAdded = 0;   
            float blurSum = 0;
            for (int iy=iylo; iy<iyhi; iy++) {
               for (int ix=ixlo; ix<ixhi; ix++) {
                  blurSum += blurSrc[iy][ix];
                  numAdded++;
               }
            }
            if (numAdded == 0) numAdded = 1;
            blurDst[y][x] = blurSum/numAdded;
         }
      }
   
      // copy dst back into src to prepare for next pass
      for (int y=0; y<layerHeight; y++) {
         for (int x=0; x<layerWidth; x++) {
            blurSrc[y][x] = blurDst[y][x];
         }
      }
   }

   LayerShadow[layer].beginDraw();
   for (int y=0; y<layerHeight; y++) {
      for (int x=0; x<layerWidth; x++) {
         float blurVal = blurDst[y][x];
         LayerShadow[layer].set(x, y, color(0, 0, 0, 255*(1-blurVal)));
      }
   }
   LayerShadow[layer].endDraw();

   // draw the image
   color c0 = color(255, 255, 255);
   color c1 = color(0, 0, 255);
   LayerImage[layer].beginDraw();
   for (int y=0; y<layerHeight; y++) {
      for (int x=0; x<layerWidth; x++) {
         float a = noise((x+(layerWidth*layer))*.02, (y+(layerHeight*layer))*.02);
         color maskColor = thisMask.get(x, y);
         float opacity = 255 - red(maskColor);
         color imgColor = lerpColor(c0, c1, a);
         imgColor = color(red(imgColor), green(imgColor), blue(imgColor), opacity);
         LayerImage[layer].set(x, y, imgColor);
      }
   }
   LayerImage[layer].endDraw();

}

