String [] Lines;

void setup() {
   size(1600, 630);
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
}
