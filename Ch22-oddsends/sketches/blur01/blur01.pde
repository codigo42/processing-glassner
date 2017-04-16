

void setup() {
   size(600, 400);
   background(110, 120, 126);
   PImage pic = loadImage("myPhoto-600-400.jpg");
   blurImage(pic,  1, 5);
   image(pic, 0, 0);
}

void blurImage(PImage img, int numPasses, int blurRadius) {
   color [][] blurSrc = new color[img.height][img.width];
   color [][] blurDst = new color[img.height][img.width];
   
   // copy the input layer's pixels into the source
   img.loadPixels();
   for (int y=0; y<img.height; y++) {
      for (int x=0; x<img.width; x++) {
         blurSrc[y][x] = img.pixels[(y*img.width)+x];
      }
   }

   // blur the image in blurSrc and save that in blurDst
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
                  color srcColor = blurSrc[iy][ix];
                  rSum += red(srcColor);
                  gSum += green(srcColor);
                  bSum += blue(srcColor);
                  aSum += alpha(srcColor);
               }
            }
            if (count == 0) count = 1;
            blurDst[y][x] = color(rSum/count, gSum/count, bSum/count, aSum/count);
         }
      }

      // copy dst into src
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            blurSrc[y][x] = blurDst[y][x];
         }
      }
   }

   // copy src back to the layer
   img.loadPixels();
   for (int y=0; y<img.height; y++) {
      for (int x=0; x<img.width; x++) {
         img.pixels[(y*img.width)+x] = blurSrc[y][x];
      }
   }
   img.updatePixels();
}
