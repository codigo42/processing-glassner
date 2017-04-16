class Disk {
   PVector center;
   float radius;
   color clr;

   Disk(PVector acenter, float aradius, color aclr) {
      center = new PVector(acenter.x, acenter.y);
      radius = aradius;
      clr = aclr;
   }

   void render(boolean drawStroke, boolean drawFill) {
      noFill();
      noStroke();
      if (drawFill) fill(clr);
      if (drawStroke) stroke(clr);
      ellipse(center.x, center.y, 2*radius, 2*radius);
   }
}

float [][] Distance;

void setup() {
   size(300, 300);
   background(0);
   smooth();
   
   Distance = new float[height][width];
   buildDistance();
   showDistance();
}

void buildDistance() {
   PImage maskImage = loadImage("mask0box.png");
   if ((maskImage.width != width) || (maskImage.height != height)) {
	  println("Please use a mask of width "+width+" and height "+height);
      exit();
   }
   maskImage.loadPixels();
   color clr;
   
   for (int dy=0; dy<height; dy++) {
      for (int dx=0; dx<width; dx++) {
         clr = maskImage.pixels[(dy*width)+dx];
         if (red(clr) == 0) {
            Distance[dy][dx] = 0;
         } else {
            Distance[dy][dx] = width*height;
            for (int py=0; py<height; py++) {
               for (int px=0; px<width; px++) {
                  clr = maskImage.pixels[(py*width)+px];
                  if (red(clr) == 0) {
                     float d = dist(px, py, dx, dy);
                     Distance[dy][dx] = min(d, Distance[dy][dx]);
                  }
               }
            }
         }
      }
   }
}

void showDistance() {
   float minD = Distance[0][0];
   float maxD = Distance[0][0];
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         minD = min(Distance[y][x], minD);
         maxD = max(Distance[y][x], maxD);
      }
   }
   println("show: minD="+minD+"  maxD="+maxD);
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float mapD = map(Distance[y][x], minD, maxD, 0, 255);
         set(x, y, color(mapD, mapD, 0));
      }
   }
}
