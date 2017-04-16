void setup() {
   size(600, 400);
   PImage img = loadImage("myPhoto.jpg");
   image(img, 0, 0, 600, 400);
}

void draw() {
   for (int y=1; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (random(1000) > 950) {
            int j = int(random(1000));
                 if (j < 250) swap(x, y, x, y-1);
            else if (j < 500) swap(x, y, x, y+1);
            else if (j < 750) swap(x, y, x-1, y);
            else              swap(x, y, x+1, y);
         }
      }
   }
}

void swap(int x0, int y0, int x1, int y1) {
  color c0 = get(x0, y0);
  color c1 = get(x1, y1);
  set(x0, y0, c1);
  set(x1, y1, c0);
}
