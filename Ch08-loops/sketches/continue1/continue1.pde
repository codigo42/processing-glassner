void setup() {
   size(600, 250);
}

void draw() {
   background(200);
   fill(47, 64, 84);
   rect(25, 25, 550, 140);
   
   fill(249, 246, 155);
   for (int xval=80; xval<550; xval+=110) {
      if (xval == 300) continue;
      ellipse(xval, 95, 80, 80);
   }
}
