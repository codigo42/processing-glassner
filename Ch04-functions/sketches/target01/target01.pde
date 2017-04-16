void setup() {
   size(600, 400);
   background(87, 66, 8);
   noStroke();
   int score = 40;   // the score of this arrow

   // draw the ball for the current value of score
   if (score == 40) {
      drawBall(160, 212, 20, 20);
   } else if (score == 30) {
      drawBall(80, 231, 48, 3);
   } else if (score == 20) {
      drawBall(40, 255, 93, 8);
   } else if (score == 10) {
      drawBall(20, 255, 140, 5);
   } else {
      drawBall(180, 32, 32, 32);
   }
}

void drawBall(int radius, int redval, int grnval, int bluval) {
   fill(color(redval, grnval, bluval));
   ellipse(300, 200, 2*radius, 2*radius);
}
