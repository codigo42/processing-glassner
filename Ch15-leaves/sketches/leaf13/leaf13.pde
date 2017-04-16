// Fall leaves project
// version 0.1, Andrew, 16 April 2009
//

// dimensions of the square drawing area
int Window = 400;

void setup() {
   size(Window, Window);
   background(200, 190, 143);
   noFill();
   frameRate(1);
}

void draw() {
   background(200, 190, 143);
   drawOneLeaf();
}

void drawOneLeaf() {
   PVector pA = new PVector(-0.5, 0.0);  // left end
   PVector pB = new PVector( 0.5, 0.0);  // right end

   PVector pG1 = makeControlPoint(-0.25, -0.15,  0.15, -0.05, -0.15, 0.0);
   PVector pG2 = makeControlPoint( 0.25, -0.15,  0.15, -0.05, -0.15, 0.0);
   PVector pH1 = makeControlPoint(-0.25, -0.15,  0.15,  0.05,  0.0, 0.15);
   PVector pH2 = makeControlPoint( 0.25, -0.15,  0.15,  0.05,  0.0, 0.15);
  
   PVector sA = pointToWindow(pA);
   PVector sB = pointToWindow(pB);
   PVector sG1 = pointToWindow(pG1);
   PVector sG2 = pointToWindow(pG2);
   PVector sH1 = pointToWindow(pH1);
   PVector sH2 = pointToWindow(pH2);

   stroke(196, 66, 63);  // red
   bezier(sA.x, sA.y, sG1.x, sG1.y, sG2.x, sG2.y, sB.x, sB.y);
   stroke(64, 135, 36);  // green
   bezier(sA.x, sA.y, sH1.x, sH1.y, sH2.x, sH2.y, sB.x, sB.y);
   
   stroke(196, 66, 63);  // red
   ellipse(sG1.x, sG1.y, 15, 15);
   ellipse(sG2.x, sG2.y, 15, 15);
   line(sA.x, sA.y, sG1.x, sG1.y);
   line(sB.x, sB.y, sG2.x, sG2.y);
   stroke(64, 135, 36);  // green);
   ellipse(sH1.x, sH1.y, 15, 15);
   ellipse(sH2.x, sH2.y, 15, 15);
   line(sA.x, sA.y, sH1.x, sH1.y);
   line(sB.x, sB.y, sH2.x, sH2.y);
}

PVector pointToWindow(PVector p) {
   PVector t = p.get();
   t.x = map(t.x, -1, 1, 0, Window-1);
   t.y = map(t.y, -1, 1, 0, Window-1);
   return(t);
}

PVector makeControlPoint(float x, float dxlo, float dxhi,
                        float y, float dylo, float dyhi) {
   float px = x + random(dxlo, dxhi);
   float py = y + random(dylo, dyhi);
   PVector t = new PVector(px, py);
   return(t);
}
