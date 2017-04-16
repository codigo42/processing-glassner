void setup() {
   size(600, 400);
}

void draw() {
   background(210, 177, 68);
   stroke(0);
   
   fill(149, 93, 13, 128);
   drawBox(150, 100, 250, 150);
   fill(139, 49, 30, 128);
   rotate(radians(20));
   drawBox(150, 100, 250, 150);
}

void drawBox(float left, float top, float wid, float hgt) {
  rect(left, top, wid, hgt);
  // draw perfectly vertical lines
  for (int x=0; x<wid; x+=20) {
    line(left+x, top-20, left+x, top+hgt+20);
  }
  // draw perfectly horizontal lines
  for (int y=0; y<hgt; y+=20) {
    line(left-20, top+y, left+wid+20, top+y);
  }
}
