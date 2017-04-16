void setup() {
   size(600, 400);
   noStroke();
}

void draw() {
   background(145, 236, 152);
   fill(6, 119, 120);
   float time = frameCount;
   PVector ballCenter = getBallCenter(time);
   ellipse(ballCenter.x, ballCenter.y, 40, 40);
}

PVector getBallCenter(float time)
{
   float xPosition = time;
   float angle = time/40.0;
   float bounceHeight = max(0, map(time, 0, 600, 1, 0));
   float yPosition = bounceHeight * abs(cos(angle));
   yPosition = map(yPosition, 0, 1, 350, 50);
   PVector center = new PVector(xPosition, yPosition);
   return(center);
}
