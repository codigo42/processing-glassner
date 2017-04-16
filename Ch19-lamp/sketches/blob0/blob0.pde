void setup() {
   size(600, 400);
   Blob blob0 = new Blob(300, 200, 100);
   blob0.render();
}

void draw() {
}

class Blob {
   float cx, cy;       // blob center
   float r;            // blob radius

   Blob(float acx, float acy, float ar) {
      cx = acx;
      cy = acy;
      r = ar;
   }

   void render() {
   }
}
