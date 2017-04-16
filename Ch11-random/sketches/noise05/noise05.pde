void setup() {
   size(600, 400);
   float noiseScale = 0.02;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*noiseScale,y*noiseScale*.1);
         noiseVal *= 255;  // scale up from [0, 1] to [0, 255]
         stroke(noiseVal);
         point(x, y);
      }
   }
}
