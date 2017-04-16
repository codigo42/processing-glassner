int Hueval = 0;
int Satval = 110;
int Brival = 110;
color MyColor;

void setup() {
   size(600, 400);
   colorMode(HSB);
   MyColor = color(Hueval, Satval, Brival);
   colorMode(RGB);
   background(MyColor);
}

void draw() {
   Hueval = Hueval+1;
   colorMode(HSB);
   MyColor = color(Hueval, Satval, Brival);
   colorMode(RGB);
   background(MyColor);
}
