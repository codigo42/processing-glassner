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
   PVector center = new PVector(time, 200);
   return(center);
}
