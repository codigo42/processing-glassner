int NumLayers;
int Waterline;
float MaxHeight;
color WindowColor = color(220, 220, 20);

void setup() {
   size(600, 400);
   smooth();
   noStroke();
   Waterline = int(height * 0.8);
   MaxHeight = random(.2*height, .6*height);
   NumLayers = int(random(6, 10));
   drawSkyline();
}

void drawSkyline() {
   drawBackground();
   for (int layer=0; layer<NumLayers; layer++) {
      drawLayer(layer);
   }
   drawLights();
}

void drawLayer(int layer) {
   float a = norm(layer, 0, NumLayers-1);
   float avgWidth = lerp(width/50.0, width/20.0, a);
   float avgHeight = lerp(MaxHeight, height/20.0, a);
   float layerDensity = lerp(.1, 1, a);
   float left = -avgWidth;

   while (left < width) {
      float buildingWidth = vary(avgWidth, .1);
      float buildingHeight = vary(avgHeight, .2);
      boolean drawMe = random(0, 1) < layerDensity;
      if (drawMe) {
         drawBuilding(left, Waterline, buildingWidth, buildingHeight);
      }
      left += buildingWidth;
   }
}

void drawBuilding(float bLeft, float bBottom, float bWid, float bHgt) {
   float buildingGrayColor = random(30, 90);
   fill(buildingGrayColor);
   rect(bLeft, bBottom, bWid, -bHgt);

   color windowColor = color(vary(red(WindowColor), .1), 
                             vary(green(WindowColor), .1), 
                             vary(blue(WindowColor), .1));
   fill(windowColor);

   // figure out how many windows to draw, then draw each one
   int numAcross = int(random(10.0, 20.0));
   int numHigh = int(random(10.0, 20));
   float wWid = bWid / (numAcross*2.0);
   float wHgt = bHgt / (numHigh*2.0);

   float windowDensity = random(0.1, 0.7);
   for (int wx=0; wx<numAcross; wx++) {
      for (int wy=0; wy<numHigh; wy++) {
         float wLeft = (1.0/(numAcross*2.0)) + (wx*2*wWid);
         float wBottom = (1.0/(numHigh*2.0)) + (wy*2*wHgt);
         if (random(0, 1) < windowDensity) {
            rect(bLeft+wLeft, bBottom-wBottom, wWid, -wHgt);
         }
      }
   }  
}

void drawBackground() {
   // draw the sky: a radial blend from (cx, cy)
   float cx = width * random(.6, .8);
   float cy = vary(Waterline, .1);
   float distToUL = dist(cx, cy, 0, 0);
   color lighter = color(5, 60, 130);
   color darker = color(0, 15, 45);

   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float a = dist(x, y, cx, cy)/distToUL;
         a = constrain(a, 0, 1);
         color clr = lerpColor(lighter, darker, a);
         float ya = 1 - norm(y, 0, Waterline);
         float threshold = .001 * ya;
         if (random(0, 1) < threshold) {
            a = sqrt(a);
            clr = lerpColor(clr, color(255), a);
         }
         set(x, y, clr);
      }
   }

   // draw the (fake) building reflections
   color waterColor = color(10,10,30);
   for (int y=Waterline; y<height; y++) {
      for (int x=0; x<width; x++) {
         // ya is distance from Waterline
         float ya = 1-norm(y, Waterline, height-1);
         // ya2 creates a short fade right at the Waterline
         float ya2 = constrain((y-Waterline)/3.0, 0, 1);
         float wnoise = noise(x*.04, y*.01);
         wnoise = ya2 * ya * sq(wnoise);
         color clr = lerpColor(waterColor, WindowColor, wnoise);
         set(x, y, clr);
      }
   }
}

void drawLights() {
   int numLights = 20;
   noStroke();
   int lradius = 8;
   for (int l=0; l<numLights; l++) {
      int lx = int(random(0, width));
      int ly = int(Waterline-lradius+vary(lradius, .1));
      color lightColor = color(
            random(210, 255),  random(210, 255),  random(210, 255));
 
      // draw the light as two circles to fake a glow
      fill(red(lightColor), green(lightColor), blue(lightColor), 128);
      ellipse(lx, ly, lradius, lradius);
      fill(red(lightColor), green(lightColor), blue(lightColor), 255);
      ellipse(lx, ly, lradius/2, lradius/2);

      // draw fake reflections and add to water color
      for (int y=Waterline; y<height; y++) {
         for (int x=lx-2; x<lx+2; x++) {
            float ya = 1-norm(y, Waterline, height-1);  
            float wnoise = noise(x*.04, y*.01);
            wnoise = sq(ya) * sq(wnoise);  // fade out noise 
            color oldclr = get(x, y);
            color clr = lerpColor(oldclr, lightColor, wnoise);
            set(x, y, clr);
         }
      }
   }
}

float vary(float value, float percent) {
  float range = value * percent;
  value += random(-range, range);
  return(value);
}
