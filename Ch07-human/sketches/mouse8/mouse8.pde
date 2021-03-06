float Redval = 192; // background red
float Grnval = 64;  // background green
float Bluval = 0;   // background blue
color MyColor;

void setup() {
   size(600, 400);
   MyColor = color(Redval, Grnval, Bluval);
   background(MyColor);
}

void draw() {
   background(MyColor);
}

void mouseMoved() {
   Redval = map(mouseX, 0, 599, 0, 255);
   Grnval = map(mouseY, 0, 399, 0, 255);
   MyColor = color(Redval, Grnval, Bluval);
}

void mouseDragged() {
   updateBlueValue();
}

void mouseClicked() {
   updateBlueValue();
}

void updateBlueValue() {
   if (mouseButton == LEFT) {
      Bluval = map(mouseX, 0, 599, 0, 255);
   } else {
      Bluval = 0;
   }
   MyColor = color(Redval, Grnval, Bluval);
}
