Ball [] Flies;

void setup() {
   size(600, 400);
   Flies = new Ball[3];
   Flies[0] = new Ball(300, 200,  2,  3, 30, 138,  59,  59, 255);
   Flies[1] = new Ball(400, 100, -2, -1, 50, 151, 166,  95, 255);
   Flies[2] = new Ball(100, 200,  3, -3, 20,  78, 120, 145, 255);
}

void draw() {
   background(128, 103, 103);
   for (int i=0; i<Flies.length; i++) {
      Flies[i].render();
      Flies[i].move();
   }
}

class Ball {
   float cx, cy;
   float vx, vy;
   float radius;
   float cr, cg, cb, ca;
  
   Ball( float acx, float acy, float avx, float avy,
   float aradius, float ar, float ag, float ab, float aa) {
      cx = acx;  cy = acy;
      vx = avx;  vy = avy;
      radius = aradius;
      cr = ar; cg = ag; cb = ab; ca = aa;
   }
  
   void render() {
      fill(cr, cg, cb, ca);
      ellipse(cx, cy, 2*radius, 2*radius);
   }
  
   void move() {
      float noiseScale = 0.02;
      radius += lerp(-1, 1, noise(frameCount*noiseScale));
      radius = constrain(radius, 10, 100);
      vx += lerp(-0.25, 0.25, noise(noiseScale*cx, noiseScale*cy));
      vy += lerp(-0.25, 0.25, noise(noiseScale*cy, noiseScale*cx));
      cx += vx;
      cy += vy;
      if ((cx-radius < 0) || (cx+radius >= width)) {
         vx = -vx;
         cx += 2*vx;
      }
      if ((cy-radius < 0) || (cy+radius >= height)) {
         vy = -vy;
         cy += 2*vy;
      }
   }
}
