Ball [] Flies;

void setup() {
   size(600, 400);
   int numFlies = 4;
   Flies = new Ball[numFlies];
   for (int i=0; i<numFlies; i++) {
      Flies[i] = new Ball();
   }
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
   
   
   Ball() {
      cx = random(50, width-50);
      cy = random(50, height-50);
      vx = random(-3, 3);
      vx = random(-3, 3);
      radius = random(10, 30);
      cr = random(100, 255);  
      cg = random(100, 255);
      cb = random(100, 255);
      ca = random(100, 255);
   }
  
   void render() {
      fill(cr, cg, cb, ca);
      ellipse(cx, cy, 2*radius, 2*radius);
   }
  
   void move() {
      float noiseScale = 0.02;
      radius += lerp(-1, 1, noise(cx*noiseScale));
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
