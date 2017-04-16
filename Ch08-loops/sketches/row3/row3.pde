void setup() {
   size(600, 250);
}

void draw() {
   background(200);
   fill(47, 64, 84);
   rect(25, 25, 550, 140);
   
   fill(249, 246, 155);
   for (int ellipseNumber = 0; ellipseNumber < 5; ellipseNumber++) {
      ellipse(80+(ellipseNumber*110), 95, 80, 80);
   }
}
