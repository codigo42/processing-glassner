void setup() {
   size(600, 400);

   float rx = 0;
   float ry = 0;
   float gx = 10;
   float gy = 10;
   float bx = 10;
   float by = 20;

   float noiseScale = 0.02;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float redVal = noise((x+rx)*noiseScale, (y+ry)*noiseScale);
         float grnVal = noise((x+gx)*noiseScale, (y+gy)*noiseScale);
         float bluVal = noise((x+bx)*noiseScale, (y+by)*noiseScale);

         stroke(255*redVal, 255*grnVal, 255*bluVal);
         point(x, y);
      }
   }
}

