void setup() {
   size(600, 400);
   background(177, 224, 214);

   float centerx = 300;
   float centery = 200;
   float r = 150;

   fill(79, 168, 81);
   beginShape();
   for (int i=0; i<8; i++) {
      float angle = map(i, 0, 8, 0, 360);
      float x = r * cos(radians(angle));
      float y = r * sin(radians(angle));
      x += centerx;
      y += centery;
      vertex(x,y);
   }
   endShape(CLOSE);
}
