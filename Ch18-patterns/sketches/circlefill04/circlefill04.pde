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
   maskImage.loadPixels();
   int[][] pass = new int[height][width];

   // anything with a black pixel has distance -1, else 0
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         color clr = maskImage.pixels[(y*width)+x];
         pass[y][x] = -1;
         if (red(clr) == 0) pass[y][x] = 0;
      }
   }

   // dilate black pixels repeatedly, each newly-dilated
   // pixel has a distance equal to number of steps of dilation
   boolean dilateAgain = true;
   int passNumber = 1;
   while (dilateAgain) {
      dilateAgain = false;
      for (int y=1; y<height-1; y++) {
         for (int x=1; x<width-1; x++) {
            if (pass[y][x] >= 0) continue;
            if ((pass[y-1][x-1] == passNumber-1) ||
                (pass[y-1][x  ] == passNumber-1) ||
                (pass[y-1][x+1] == passNumber-1) ||
                (pass[y  ][x-1] == passNumber-1) ||
                (pass[y  ][x+1] == passNumber-1) ||
                (pass[y+1][x-1] == passNumber-1) ||
                (pass[y+1][x  ] == passNumber-1) ||
                (pass[y+1][x+1] == passNumber-1)) {
                  dilateAgain = true;
                  pass[y][x] = passNumber;
            }
         }
      }
      passNumber++;
   }

   // copy the temporary mask into the Distance array
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         Distance[y][x] = pass[y][x];
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
