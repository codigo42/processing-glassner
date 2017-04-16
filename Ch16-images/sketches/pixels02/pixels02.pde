
int WindowSize = 400; 

void setup() {
   size(WindowSize, WindowSize);
}

void draw() {
   background(0);
   color color0 = color(35, 160, 255);
   color color1 = color(255, 116, 0);
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*.015, y*.015);
         color thisColor = lerpColor(color0, color1, noiseVal);
         set(x, y, thisColor);
      }
   }
}
