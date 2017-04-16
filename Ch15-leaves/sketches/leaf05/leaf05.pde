// Fall leaves project
// version 0.1, Andrew, 16 April 2009
//

// dimensions of the square drawing area
int Window = 400;

void setup() {
   size(Window, Window);
   background(200, 190, 143);
   noFill();
}

void draw() {
   drawOneLeaf();
}

void drawOneLeaf() {
  /*
   Point2 pA = new Point2(-0.5, 0.0);  // left end
   Point2 pB = new Point2(-0.5, 0.0);  // right end

   Point2 pG1 = new Point2(-.25, -.25);
   Point2 pG2 = new Point2( .25, - 25);
   Point2 pH1 = new Point2(-.25, - 25);
   Point2 pH2 = new Point2( .25, - 25);
  
   Point2 sA = pointToWindow(pA);
   Point2 sB = pointToWindow(pB);
   Point2 sG1 = pointToWindow(pG1);
   Point2 sG2 = pointToWindow(pG2);
   Point2 sH1 = pointToWindow(pH1);
   Point2 sH2 = pointToWindow(pH2);

   stroke(196, 66, 63);  // red
   bezier(sA.x, sA.y, sG1.x, sG1.y, sG2.x, sG2.y, sB.x, sB.y);
   stroke(64, 135, 36);  // green
   bezier(sA.x, sA.y, sH1.x, sH1.y, sH2.x, sH2.y, sB.x, sB.y);
   */
   
   PVector pul = new PVector(-.5, -.25);  // upper left
   PVector pur = new PVector( .5, -.25);  // upper right
   PVector plr = new PVector( .5,  .25);  // lower right
   PVector pll = new PVector(-.5,  .25);  // lower left
   pul = pointToWindow(pul);
   pur = pointToWindow(pur);
   plr = pointToWindow(plr);
   pll = pointToWindow(pll);
   fill(0, 0, 255);
   rect(pul.x, pul.y, plr.x-pul.x, plr.y-pul.y);
}

PVector pointToWindow(PVector p) {
   PVector t = p.get();
   t.x = map(t.x, -1, 1, 0, Window-1);
   t.y = map(t.y, -1, 1, 0, Window-1);
   return(t);
}
