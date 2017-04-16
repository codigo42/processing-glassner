void setup() {

   // replace these values with your RGB color
   float r = 102;
   float g = 164;
   float b = 180;

   colorMode(RGB);
   color clr = color(r, g, b);
   float hue = hue(clr);
   float sat = saturation(clr);
   float bri = brightness(clr);

   println("RGB ("+r+", "+g+", "+b+") = HSB ("+hue+", "+sat+", "+bri+")");
}
