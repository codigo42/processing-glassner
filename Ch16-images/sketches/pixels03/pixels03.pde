int NumLayers = 10;   
int WindowSize = 400; 

void setup() {
   size(WindowSize, WindowSize);
}

void draw() {
   background(0);
   color color0 = color(35, 160, 255);
   color color1 = color(255, 116, 0);
   float layerHeight = 1.0/NumLayers;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*.015, y*.015);

         color thisColor = color0;
         int whichColor = int(noiseVal/layerHeight);
         if (((whichColor) % 2) == 0) thisColor = color0;
         else thisColor = color1;
         
         set(x, y, thisColor);
      }
   }
}
