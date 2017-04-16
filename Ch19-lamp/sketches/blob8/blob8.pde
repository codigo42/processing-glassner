PImage Img;
float [][] Temperature;

void setup() {
   size(600, 400);
   Img = createImage(width, height, RGB);
   Temperature = new float[height][width];

   Blob blob0 = new Blob(300, 200, 100);
   Blob blob1 = new Blob(400, 230, 75);
   Blob blob2 = new Blob(230, 270, 80);
  
   zeroTemperature();
   blob0.render();
   blob1.render();
   blob2.render();
   
   Img.loadPixels();
   buildImage();
   Img.updatePixels();
   image(Img, 0, 0);
}

void draw() {
}

void zeroTemperature() {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         Temperature[y][x] = 0;
      }
   }
}

void buildImage() {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float midT = 0.4;
         float rangeT = 0.05;
         if (abs(Temperature[y][x] - midT) < rangeT) {
            Img.set(x, y, color(255, 0, 0));
         } else {
            float t = map(Temperature[y][x], 0, 1.5, 0, 255);
            Img.set(x, y, color(t, t, 0));
         }
      }
   }
}

class Blob {
   float cx, cy;   // blob center
   float r;        // blob radius

   Blob(float acx, float acy, float ar) {
      cx = acx;
      cy = acy;
      r = ar;
   }

   void render() {
      for (float y=cy-r; y<cy+r; y++) {
         for (float x=cx-r; x<cx+r; x++) {
            float d = dist(x, y, cx, cy);
            if (d > r) continue;
            float h = map(d, 0, r, 1, 0);
            Temperature[int(y)][int(x)] += h;
         }
      }
   }
}
