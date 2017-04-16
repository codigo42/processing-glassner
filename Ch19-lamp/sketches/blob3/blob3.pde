PImage Img;

void setup() {
   size(600, 400);

   Img = createImage(width, height, RGB);
	
   color bgcolor = color(0, 0, 0);
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
      Img.set(x, y, bgcolor);
      }
   }

   Blob blob0 = new Blob(300, 200, 100);
   Blob blob1 = new Blob(400, 230, 75);

   Img.loadPixels();
   blob0.render();
   blob1.render();
   Img.updatePixels();
   image(Img, 0, 0);
}

void draw() {
}

class Blob {
   float cx, cy;		// blob center
   float r;			// blob radius

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
            int ix = int(x);
            int iy = int(y);
            color oldColor = Img.get(ix, iy);
            float newRed = (255*h) + red(oldColor);
            float newGrn = (255*h) + green(oldColor);
            float newBlu = blue(oldColor);
            Img.set(int(x), int(y), color(newRed, newGrn, newBlu));
         }
      }
   }
}
