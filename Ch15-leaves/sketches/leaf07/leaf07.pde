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
   PVector pA = new PVector(-0.5, 0.0);  // left end
   PVector pB = new PVector( 0.5, 0.0);  // right end

   PVector pG1 = new PVector(-(.25+random(0,.15)), -(.25+random(0, .15)));
   PVector pG2 = new PVector( (.25+random(0,.15)), -(.25+random(0, .15)));
   PVector pH1 = new PVector(-(.25+random(0,.15)),  (.25+random(0, .15)));
   PVector pH2 = new PVector( (.25+random(0,.15)),  (.25+random(0, .15)));
  
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
}

PVector pointToWindow(PVector p) {
   PVector t = p.get();
   t.x = map(t.x, -1, 1, 0, Window-1);
   t.y = map(t.y, -1, 1, 0, Window-1);
   return(t);
}
