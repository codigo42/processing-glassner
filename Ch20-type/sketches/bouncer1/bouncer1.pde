void setup() {
   size(600, 400);
   smooth();
   PFont fortuneFont = loadFont("MarkerFelt-Wide-48.vlw");
   textAlign(CENTER);
   textFont(fortuneFont, 36);
   fill(207, 113, 53);
}

void draw() {
   background(31, 35, 71);
   float sinVal = sin(frameCount * .07);
   float scaleMul = map(sinVal, -1, 1, .5, 2);
   translate(300, 200);
   scale(scaleMul);
   text("Delicious apricots!", 0, 0);
}
