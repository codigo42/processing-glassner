void setup() {
   size(600, 400);
   noStroke();
   handleBox(0, 0, 600, 400, 128);
}

void handleBox(float ulx, float uly, float wid, float hgt, int gray) {
   fill(gray);
   rect(ulx, uly, wid, hgt);
}

