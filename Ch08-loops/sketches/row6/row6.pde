void setup() {
   size(600, 250);
}

void draw() {
   background(200);
   fill(47, 64, 84);
   rect(25, 25, 550, 140);
   
   for (int eCount = 0; eCount<11; eCount++) {
      int xValue = 60 + (eCount * 48);
      float myAlpha = map(eCount, 0, 9, 0, 255);
      color myColor = color(249, 246, 155, myAlpha);
      fill(myColor);
      ellipse(xValue, 165, 40, 40);
   }
}

