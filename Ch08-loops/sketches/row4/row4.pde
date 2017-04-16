void setup() {
   size(600, 250);
}

void draw() {
   background(200);
   fill(47, 64, 84);
   rect(25, 25, 550, 140);
   
   fill(249, 246, 155);
   for (int eCount = 0; eCount<11; eCount++) {
      int xValue = 60 + (eCount * 48);
      ellipse(xValue, 95, 40, 40);
   }
}

