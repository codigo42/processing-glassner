void setup() {
   size(600, 400);
   noStroke();
   handleBox(0, 0, 600, 400, color(128, 128, 128));
}

void handleBox(float ulx, float uly, float wid, float hgt, color clr) {
   fill(clr);
   rect(ulx, uly, wid, hgt);
   int minSide = 20;
   if ((wid < minSide) || (hgt < minSide)) {
      return;
   }
   if (wid > hgt) {
      float leftWid = wid * random(0.25, 0.75);  // width of the left box
      handleBox(ulx, uly, leftWid, hgt, wiggleColor(clr, -20, -10));
      handleBox(ulx+leftWid, uly, wid-leftWid, hgt, wiggleColor(clr, 10, 20));
   } else {
      float topHgt = hgt * random(0.25, 0.75);  // height of the top box
      handleBox(ulx, uly, wid, topHgt, wiggleColor(clr, -20, -10));
      handleBox(ulx, uly+topHgt, wid, hgt-topHgt, wiggleColor(clr, 10, 20));
   }
}
