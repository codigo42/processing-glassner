void setup() {
   size(600, 400);
   noStroke();
   handleBox(0, 0, 600, 400, 128);
}

void handleBox(float ulx, float uly, float wid, float hgt, int gray) {
   fill(gray);
   rect(ulx, uly, wid, hgt);
   int minSide = 20;
   if ((wid < minSide) || (hgt < minSide)) {
      return;
   }
   if (wid > hgt) {
      float leftWid = wid * random(0.25, 0.75);  // width of the left box
      handleBox(ulx, uly, leftWid, hgt, gray-10);
      handleBox(ulx+leftWid, uly, wid-leftWid, hgt, gray+10);
   } else {
      float topHgt = hgt * random(0.25, 0.75);  // height of the top box
      handleBox(ulx, uly, wid, topHgt, gray-10);
      handleBox(ulx, uly+topHgt, wid, hgt-topHgt, gray+10);
   }
}
