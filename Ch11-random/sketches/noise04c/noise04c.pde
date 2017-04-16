void setup() {
   size(600, 400);
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float xScale = map(x, 0, width, .02, .05);
         float yScale = .01;
         float noiseVal = noise(x*xScale,y*yScale);
         noiseVal *= 255;  // scale up from [0, 1] to [0, 255]
         stroke(noiseVal);
         point(x, y);
      }
   }
}
