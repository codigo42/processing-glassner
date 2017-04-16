String [] Lines;

void setup() {
   size(315, 800);
   background(214, 192, 178);
   noStroke();
   smooth();
   color black = color(0, 0, 0);
   color white = color(255, 255, 255);
   Lines = loadStrings("../Body-ManPoints.txt");
   drawShape(black);
   Lines = loadStrings("../BellyHole-ManPoints.txt");
   drawShape(white);
   Lines = loadStrings("../EyeHole-ManPoints.txt");
   drawShape(white);
   Lines = loadStrings("../FootHole-ManPoints.txt");
   drawShape(white);
   Lines = loadStrings("../UpCircleHole-ManPoints.txt");
   drawShape(white);
   Lines = loadStrings("../UpperHole-ManPoints.txt");
   drawShape(white);
}

void drawShape(color clr) {
   fill(clr);
   beginShape();
   for (int i=0; i<Lines.length; i++) {
      String[] vals = split(Lines[i], '\t');
      int x = int(vals[0])/2;
      int y = int(vals[1])/2;
      vertex(y, height-x);
   }
   endShape();
}
