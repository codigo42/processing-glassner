void setup() {
   size(600, 400);
   background(87, 66, 8);
   noStroke();
   int score = 40;   // the score of this arrow

   // draw the ball for the current value of score
   switch (score) {
      case 40:
         drawBall(160, 212, 20, 20);
         break;
      case 30:
         drawBall(80, 231, 48, 3);
         break;
      case 20:
         drawBall(40, 255, 93, 8);
         break;
      case 10:
         drawBall(20, 255, 140, 5);
         break;
      default:
         drawBall(180, 32, 32, 32);
         break;
   }
}

void drawBall(int radius, int redval, int grnval, int bluval) {
   fill(color(redval, grnval, bluval));
   ellipse(300, 200, 2*radius, 2*radius);
}
