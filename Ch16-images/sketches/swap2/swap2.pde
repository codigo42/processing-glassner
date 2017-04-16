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
                 if (j < 250) set(x, y, get(x, y-1));
            else if (j < 500) set(x, y, get(x, y+1));
            else if (j < 750) set(x, y, get(x-1, y));
            else              set(x, y, get(x+1, y));
         }
      }
   }
}
