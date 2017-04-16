void setup() {
  size(600, 400);
  background(150, 90, 65);
  fill(250, 200, 90);
  
  int numCircles = 30;
  for (int count=0; count<numCircles; count++) {
    float radius = random(10, 40);
    float xCenter = random(radius, width-radius);
    float yCenter = random(radius, height-radius);
    ellipse(xCenter, yCenter, radius*2, radius*2);
  } 
}
