// Fall leaves project
// version 1.0, Andrew, 16 April 2009
//

// dimensions of the square drawing area
int Window = 400;

void setup() {
   size(Window, Window, P2D);
   background(82, 52, 12);
   noStroke();
   //frameRate(1/5.0);
}

void draw() {
   //background(200, 190, 143);
   if (random(1000) > 300) drawOneLeaf(true);
                      else drawOneLeaf(false);
}

void drawOneLeaf(boolean drawInside) {
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

   if (drawInside) {
      for (int d=0; d<5000; d++) {
         float t = random(0.0, 1.0);
         t += .07 * sin(TWO_PI*t);
         float px = lerp(pA.x, pB.x, t);
         float uy = bezierPoint(pA.y, pG1.y, pG2.y, pB.y, t);
         float ly = bezierPoint(pA.y, pH1.y, pH2.y, pB.y, t);
         float a = random(0.0, 1.0);
         float py = lerp(uy, ly, a);
         float myAlpha = map(abs(.5-a), 0, .5, 255, 0);
         stroke(leafColor, myAlpha);
         point(px, py);
      }
   } else {
      for (int d=0; d<50000; d++) {
         float tbump = 0.3;
         float aura = 0.5;
         float t = random(-tbump, 1+tbump);
            
         float px = lerp(pA.x, pB.x, t); // can't use bezierPoint because they curl up
         float py, dir;
         if (random(1000) > 500) {
            dir = -1;
            py = bezierPoint(pA.y, pG1.y, pG2.y, pB.y, t);
         } else {
            dir = 1;
            py = bezierPoint(pA.y, pH1.y, pH2.y, pB.y, t);
         }
         
         // add fading to the sides
         float tfade = 1.0;
         if (t < 0) {
            tfade = 1-(abs(t)/tbump);
            py = pA.y;
         } else if (t > 1) {
            tfade = 1-((t-1)/tbump);
            py = pB.y;
         }

         float auraD = random(aura);
         float aurafade = 1-(auraD/aura);
         aurafade *= tfade;
         aurafade = map(cos(PI * aurafade), 1, -1, 0, 1);
         py += dir * auraD;
         stroke(leafColor, 255*aurafade);
         point(px, py);
      }
   }
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
