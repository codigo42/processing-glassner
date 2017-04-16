void setup() {
   size(750, 550);
   smooth();
   background(173, 180, 125);
   int hPattern = 0;
   int vPattern = 0;
   drawPatterns(hPattern, vPattern);
   drawDots(hPattern, vPattern);
}

float getRandom(int patternChoice) {
    float x, y, threshold;
    do {
       x = random(0, 1);
       y = random(0, 1);
       threshold = getThreshold(x, patternChoice);
    } while (y>threshold);
    return(x);
}

void drawPatterns(int hPattern, int vPattern) {
   fill(240, 218, 180);
   stroke(0);
   rect(125, 25, 600, 100);  // horizontal plot area
   rect(25, 125, 100, 400);  // vertical plot area

   fill(240, 275, 180);
   rect(125, 125, 600, 400);  // the main dots area

   noFill();
   stroke(3, 125, 135);
   float oldpx = 0;
   float oldpy = 0;
  
   // draw the horizontal pattern
   for (int x=0; x<600; x++) {
      float ax = x/599.0;
      float y = getThreshold(ax, hPattern);
      float px = 125+x;
      float py = 125 - (100*y);
      if (x>0) line(oldpx, oldpy, px, py);
      oldpx = px;
      oldpy = py;
   }

   // draw the vertical pattern
   for (int y=0; y<400; y++) {
      float ay = y/399.0;
      float x = getThreshold(ay, vPattern);
      float px = 125 - (100*x);
      float py = 125+y;
      if (y>0) line(oldpx, oldpy, px, py);
      oldpx = px;
      oldpy = py;
   }
}

void drawDots(int hPattern, int vPattern) {
   noStroke();
   fill(205, 125, 28);
   int numEllipses = 1800;
   for (int i=0; i<numEllipses; i++) {
      float px = 600 * getRandom(hPattern);
      float py = 400 * getRandom(vPattern);
      ellipse(125+px, 125+py, 8, 8);
   }
}

float getThreshold(float x, int patternChoice) {
    float loAngle, hiAngle;
    switch (patternChoice) {
       case 0:  // uniform
          loAngle = hiAngle = 0;
          break;
       case 1:  // one hump
          loAngle = PI;
          hiAngle = 3*PI;
          break;
       case 2:  // two humps
          loAngle = PI;
          hiAngle = 5*PI;
          break;
       case 3:  // one dip
          loAngle = 0;
          hiAngle = 2*PI;
          break;
       case 4:  // two dips
          loAngle = 0;
          hiAngle = 4*PI;
          break;
       case 5:  // S 
          loAngle = PI;
          hiAngle = 2*PI;
          break;
       case 6:  // backwards S
          loAngle = 0;
          hiAngle = PI;
          break;
       default:
          println("I don't know pattern choice "+patternChoice);
          loAngle = hiAngle = 0;
          break;
    }
    float angle = lerp(loAngle, hiAngle, x);
    float threshold = map(cos(angle), -1, 1, 0, 1);
    return(threshold);
}
