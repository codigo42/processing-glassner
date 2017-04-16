// Fall leaves project
// version 0.1, Andrew, 16 April 2009
//

// dimensions of the square drawing area
int Window = 400;

void setup() {
   size(Window, Window);
   background(200, 190, 143);
   noStroke();
   //frameRate(1);
}

void draw() {
   //background(200, 190, 143);
   drawOneLeaf();
}

void drawOneLeaf() {
   PVector pA = new PVector(-0.5, 0.0);  // left end
   PVector pB = new PVector( 0.5, 0.0);  // right end

   PVector pG1 = makeControlPoint(-0.25, -0.15,  0.15, -0.05, -0.15, 0.0);
   PVector pG2 = makeControlPoint( 0.25, -0.15,  0.15, -0.05, -0.15, 0.0);
   PVector pH1 = makeControlPoint(-0.25, -0.15,  0.15,  0.05,  0.0, 0.15);
   PVector pH2 = makeControlPoint( 0.25, -0.15,  0.15,  0.05,  0.0, 0.15);
   
   // move the H control points so that the leaf bends
   float yMove = random(0, 0.35);
   if (random(100) > 80) {
      yMove = -yMove;
   }
   pG2.y += yMove;
   pH2.y += yMove;
  
   color leafColor = makeLeafColor();
   fill(leafColor);

   translate(Window/2, Window/2);
   
   float xTrans = random(-Window, Window);
   float yTrans = random(-Window, Window);
   translate(xTrans, yTrans);

   float scaleFactor = random(0.6, 1.0);
   scale(scaleFactor*Window/2);
   float rotationAngle = random(0, 360);
   rotate(radians(rotationAngle));
   beginShape();
   vertex(pA.x, pA.y);
   bezierVertex(pG1.x, pG1.y, pG2.x, pG2.y, pB.x, pB.y);
   bezierVertex(pH2.x, pH2.y, pH1.x, pH1.y, pA.x, pA.y);
   endShape();
}

PVector makeControlPoint(float x, float dxlo, float dxhi,
                        float y, float dylo, float dyhi) {
   float px = x + random(dxlo, dxhi);
   float py = y + random(dylo, dyhi);
   PVector t = new PVector(px, py);
   return(t);
}

int [] LeafRGB = {
   117,  48,   0,     32,  16,   0,     80,  32,   0,     144,  64,   0,
   128,  48,   0,     80,  16,   0,     48,  32,  16,     144,  80,   0,
    32,  32,   0,    160,  96,   0,    176,  80,   0,      48,  16,   0,
   192, 112,   0,     64,  64,   0,     16,  48,   0,      80,  80,  64,
   224, 160,   0,     48,  64,  32,     32,  80,  32,     176,  48,   0,
   224, 144,  64,     80, 128,  32,    144, 112,  48,     240, 208,   0,
   240, 176,  64,    224, 144,   0,    224, 144,  32,     192, 112,  64,
   208,  16,   0,    240,  80,   0,    224,  48,   0,     240, 224,   0,
   240, 112,  16,    224,  64,   0,     64,  80,  16,     176,  16,   0,
    48,   0,   0,     64,  16,   0,     80, 128,   0,      96,  32,   0
};

color makeLeafColor() {
   int w = int(random(LeafRGB.length/3));
   color clr = color(LeafRGB[w*3], LeafRGB[1+(w*3)], LeafRGB[2+(w*3)], 
                     random(64, 192));
   return clr;
}
