int Redval = 192;
int Grnval = 64;
int Bluval = 0;
color MyColor;

void setup() {
   size(600, 400);
   MyColor = color(Redval, Grnval, Bluval);
   background(MyColor);
}

void draw() {
   Redval = Redval+1;
   if (Redval > 255) Redval=0;
   MyColor = color(Redval, Grnval, Bluval);
   background(MyColor);
}
