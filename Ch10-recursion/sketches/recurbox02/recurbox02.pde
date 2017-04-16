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
      float wid2 = wid/2.0;
      handleBox(ulx, uly, wid2, hgt, gray-10);
      handleBox(ulx+wid2, uly, wid2, hgt, gray+10);
   } else {
      float hgt2 = hgt/2.0;
      handleBox(ulx, uly, wid, hgt2, gray-10);
      handleBox(ulx, uly+hgt2, wid, hgt2, gray+10);
   }
}
