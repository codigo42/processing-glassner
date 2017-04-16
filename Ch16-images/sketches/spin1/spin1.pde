void setup() {
   size(600, 400);
   background(110, 120, 126);
   PImage pic = loadImage("myPhoto.jpg");
   for (int i=0; i<5; i++) {
      pushMatrix();
         rotate(radians(i * -20));
         image(pic, 0, 0, 200, 160);
      popMatrix();
      translate(100, 80);
   }
}
