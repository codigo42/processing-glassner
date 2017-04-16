float [][] Distance;
Disk [] DiskList;

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

void setup() {
   size(600, 600);
   background(0);
   smooth();
   //randomSeed(5);

   DiskList = new Disk[0];
   Distance = new float[height][width];
   buildDistance();

   buildPicture();
}

void buildPicture() {
   float goalRadius = maxDistance();
   while (goalRadius > 1) {
      if (!fitCircle(goalRadius)) {
         goalRadius--;
      }
   }
   background(0);
   for (int i=0; i<DiskList.length; i++) {
      DiskList[i].render(false, true);
   }
}

void buildDistance() {
   PImage maskImage = loadImage("mask0box.png");
   maskImage.loadPixels();
   int[][] mask = new int[height][width];

   // anything with a black pixel has distance -1, else 0
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         color clr = maskImage.pixels[(y*width)+x];
         mask[y][x] = -1;
         if (red(clr) == 0) mask[y][x] = 0;
      }
   }

   // dilate black pixels repeatedly, each newly-dilated
   // pixel has a distance equal to number of steps of dilation
   boolean dilateAgain = true;
   int passNumber = 1;
    int markCount = 0;
   while (dilateAgain) {
      dilateAgain = false;
      for (int y=1; y<height-1; y++) {
         for (int x=1; x<width-1; x++) {
            if (mask[y][x] > 0) continue;
            if ((mask[y-1][x-1] == passNumber-1) ||
                (mask[y-1][x  ] == passNumber-1) ||
                (mask[y-1][x+1] == passNumber-1) ||
                (mask[y  ][x-1] == passNumber-1) ||
                (mask[y  ][x+1] == passNumber-1) ||
                (mask[y+1][x-1] == passNumber-1) ||
                (mask[y+1][x  ] == passNumber-1) ||
                (mask[y+1][x+1] == passNumber-1)) {
                  dilateAgain = true;
                  mask[y][x] = passNumber;
            }
         }
      }
      passNumber++;
   }

   // copy the temporary mask into the Distance array
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         Distance[y][x] = mask[y][x];
      }
   }
}

boolean fitCircle(float radius) {
   float maxRadius = maxDistance();
   if (maxRadius < radius) {
      return(false);
   }
   PVector center = getAnyPixelWithDistance(radius); 
   updateDistance(center, radius);
   color clr = color(random(100,255), random(100,255), random(100,255));
   Disk newDisk = new Disk(center, radius, clr);
   DiskList = (Disk[])append(DiskList, newDisk);
   return(true);
}

float maxDistance() {
   float maxd = Distance[0][0];
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         maxd = max(Distance[y][x], maxd);
      }
   }
   return(maxd);
}

PVector getAnyPixelWithDistance(float d)
{
   int numPixels = 0;
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (Distance[y][x] >= d) {
            numPixels++;
         }
      }
   }
   int whichPixel = int(random(0, numPixels));
   int pixelCount = 0;
   PVector result = new PVector();
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         if (Distance[y][x] >= d) {
            result.x = x;
            result.y = y;
            if (pixelCount++ == whichPixel) {
               return(result);
            }
         }
      }
   }
   // we should have returned by now, but safety first
   return(result);
}

void updateDistance(PVector center, float radius) {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float d = dist(x, y, center.x, center.y);
         Distance[y][x] = min(Distance[y][x], d-radius);
      }
   }
}
