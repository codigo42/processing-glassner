float TopoMap[][];

void setup() {
   size(600, 400);
   TopoMap = new float[height][width];
   initTopoMap();
   background(0);
   drawTopoMap();
}

void draw() {
   int numDropsToFollow = 50;
   for (int i=0; i<numDropsToFollow; i++) {
      drawOneDrop();
   }
}

void initTopoMap() {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         TopoMap[y][x] = noise(x*.01, y*.01);
      }
   }
}

// draw the topo map in blue isobands
void drawTopoMap() {
   background(0);
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float v = TopoMap[y][x];
         int vphase = int(v/.1);
         if (vphase%2 == 0) set(x, y, color(0, 0, 192));
         else set(x, y, color(0, 0, 128));
      }
   }
}

void drawOneDrop() {
   // pick a color for this drop 
   float rval = random(100, 255);
   float gval = random(100, 255);
   float bval = random(20, 150);
   stroke(rval, gval, bval, 32);
   noFill();

   // pick a random point on the window to start from
   PVector center = new PVector(random(0, width), random(0, height));

   // as long as we don't have a reason to stop, keep moving
   PVector motion = new PVector(0, 0);
   int stepCount = 0;
   boolean updateAgain = true;
   while (updateAgain) {
      int searchRadius = 7;

      float minx = center.x;
      float miny = center.y;
      float minv = 999;

      // find the smallest value in a circle around the current center
      int angleSteps = round(12 * searchRadius);
      for (int i=0; i<angleSteps; i++) {
         float theta = map(i, 0, angleSteps-1, 0, TWO_PI);
         int px = round(center.x + (searchRadius * cos(theta)));
         int py = round(center.y + (searchRadius * sin(theta)));
         if ((px<0) || (px >= width-1) || (py<0) || (py >= height-1)) continue;
         float v = TopoMap[py][px];
         if (v < minv) { minv = v;  minx = px;  miny = py; }
      }
      
      // move 1 unit in that direction and draw a short line behind us
      motion.x = minx-center.x;
      motion.y = miny-center.y;
      motion.normalize();

      line(center.x, center.y, center.x+motion.x, center.y+motion.y);
      center.x += motion.x;
      center.y += motion.y;

      // stop if we're not moving, off screen, or have taken too many steps
      if (mag(motion.x, motion.y) < 0.01) updateAgain = false;
      if ((center.x < 0) || (center.x >= width) || 
          (center.y < 0) || (center.y >= height)) updateAgain = false;
      if (++stepCount > width*2) updateAgain = false;
   }
}

