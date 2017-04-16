void setup() {
   color c0 = color(199, 172, 115 );
   color c1 = color( 46, 106, 148 );
   size(800, 450);
   noStroke();
   int numSteps = 700;
   for (int i=0; i<numSteps; i++) {
     float a = i/(numSteps-1.0);
     
     // RGB upper
     colorMode(RGB);
     fill(lerpColor(c0, c1, a));
     rect(50+i, 50, 1, 150);
     
     // HSB lower
     colorMode(HSB);
     fill(lerpColor(c0, c1, a));
     rect(50+i, 250, 1, 150);
     colorMode(RGB);
   }
}

