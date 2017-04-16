void setup() {
   size(600, 250);
}

void draw() {
   background(200);
   fill(47, 64, 84);
   rect(25, 25, 550, 140);
   
   fill(249, 246, 155);
   int xValue = 80;
   int ellipseNumber = 0; 
   while (ellipseNumber < 5) {
      ellipse(xValue, 95, 80, 80);
      ellipseNumber = ellipseNumber + 1;
      xValue = xValue + 110;
   }
}
