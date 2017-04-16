PImage Img;
float [][] Temperature;
float MinBlobVal = 0.01831564; 
Blob [] Wax;

void setup() {
   size(600, 400);
   Img = createImage(width, height, RGB);
   Temperature = new float[height][width];

   makeWax();
  
   zeroTemperature();
   for (int i=0; i<Wax.length; i++) {
     Wax[i].render();
   }
   
   Img.loadPixels();
   buildImage();
   Img.updatePixels();
   image(Img, 0, 0);
}

void draw() {
}

void makeWax() {
   Wax = new Blob[3];
   Wax[0] = new Blob(300, 200, 100);
   Wax[1] = new Blob(400, 230, 75);
   Wax[2] = new Blob(145, 270, 210);
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
      int lox = max(0, int(cx-r));
      int hix = min(width, int(cx+r));
      int loy = max(0, int(cy-r));
      int hiy = min(height, int(cy+r));
      for (int y=loy; y<hiy; y++) {
         for (int x=lox; x<hix; x++) { 
            float d2 = sq(x-cx)+sq(y-cy);
            if (d2 > r*r) continue;
            float d = sqrt(d2);
            float h = map(d, 0, r, 1, 0);
            float v = exp(-4*h*h);
            v = map(v, 1, MinBlobVal, 0, 1); 
            Temperature[y][x] += v;
         }
      }
   }
}
