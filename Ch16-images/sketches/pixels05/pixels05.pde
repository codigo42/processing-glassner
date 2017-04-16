int NumLayers = 10;   // smaller values = bigger blobs
int Speed = 20;       // smaller values = faster animation
int WindowSize = 400; // smaller values = smaller window = smoother animation

void setup() {
   size(WindowSize, WindowSize);
}

void draw() {
   background(0);
   color color0 = color(35, 160, 255);
   color color1 = color(255, 116, 0);
   color thisColor = color0;
   float layerHeight = 1.0/NumLayers;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*.015, y*.015);

         float noiseBump = lerp(0, layerHeight, (frameCount % Speed)/(1.0*Speed));
         int whichColor = int((noiseVal+noiseBump)/layerHeight);
         int startingColor = (((frameCount/Speed) % 2) == 0) ? 0 : 1;
         if (((whichColor+startingColor) % 2) == 0) thisColor = color0;
         else thisColor = color1;
         
         set(x, y, thisColor);
      }
   }
}
