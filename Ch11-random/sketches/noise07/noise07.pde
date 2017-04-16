void setup() {
   size(600, 400);
   float noiseScale = 0.02;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float noiseVal = noise(x*noiseScale,y*noiseScale*.1);
         noiseVal *= noiseVal;
         float redVal = lerp(114, 194, noiseVal);
         float grnVal = lerp( 32, 106, noiseVal);
         float bluVal = lerp( 12,  14, noiseVal);
         stroke(redVal, grnVal, bluVal);
         point(x, y);
      }
   }
}
