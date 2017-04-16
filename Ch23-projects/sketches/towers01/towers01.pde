int NumTowers = 1500;    // the total number of towers to draw
float MinStartD = 0.05;  // distance to the base of the innermost tower
float MaxStartD = 0.2;   // distance to the base of the outermost tower

float Xoffset = .25;     // X location (as a percent of the window) of the vent
float Yoffset = .4;      // Y location (as a percent of the window) of the vent

void setup() {
   size(600, 600);
   smooth();
   noStroke();
   background(0);
   drawTowers();
}

void drawTowers() {

   PVector origin = new PVector(Xoffset*width, Yoffset*height);
   for (int i=0; i<NumTowers; i++) {
      float alfa = i*1.0/(NumTowers-1);
      alfa = 1-cos(radians(90*alfa)); 
      float startDistancePercent = lerp(MaxStartD, MinStartD, alfa);
      drawTower(startDistancePercent, origin);
   }
}

void drawTower(float startDistancePercent, PVector origin) {
   PVector start;
   PVector end;
   float farRadius, nearRadius;
   color clr;

   float windowRadius = dist(0, 0, width, width)/2;
   float distToStart = startDistancePercent * windowRadius;
   float distToEnd = 5*distToStart;
      
   PVector direction = new PVector(random(-1, 1), random(-1, 1));
   direction.normalize();
   start = new PVector(origin.x + distToStart * direction.x, origin.y + distToStart * direction.y);
   end   = new PVector(origin.x + distToEnd   * direction.x, origin.y + distToEnd   * direction.y);

   float normDist = norm(startDistancePercent, MinStartD, MaxStartD);
   farRadius = width/100.0;
   nearRadius = lerp(farRadius*10, farRadius, normDist);

   color base0 = color(226, 105, 8);
   color base1 = color(27, 205, 226);
   float dr = 25;
   base0 = color(red(base0)+(dr*random(-1, 1)), green(base0)+(dr*random(-1, 1)), blue(base0)+(dr*random(-1,1)));
   base1 = color(red(base1)+(dr*random(-1, 1)), green(base1)+(dr*random(-1, 1)), blue(base1)+(dr*random(-1,1)));
   clr = lerpColor(base0, base1, normDist);

   int numSteps = width/4;
   for (int step=0; step<numSteps; step++) {
      float alfa = step*1.0/(numSteps-1);
      boolean drawStroke = (random(0, 1000) > 900) ;
      if (step == numSteps-1) drawStroke = true;

      float rHere = lerp(farRadius, nearRadius, alfa);
      float xHere = lerp(start.x, end.x, alfa);
      float yHere = lerp(start.y, end.y, alfa);

      float bigr = rHere * 1.2;
      fill(0, 0, 0, 16);
      noStroke();
      ellipse(xHere, yHere, bigr, bigr);
                
      fill(clr);
      if (drawStroke) stroke(0); else noStroke();
      ellipse(xHere, yHere, rHere, rHere);
   }
}
