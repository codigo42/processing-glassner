void setup() {
  size(600, 400);
}

void draw() {
  background(150, 90, 65);
  fill(250, 200, 90);
  
  int numCircles = 30;

  for (int count=0; count<numCircles; count++) {
    float redval = 250 + random(-30, 30);
    float grnval = 200 + random(-30, 30);
    float bluval =  90 + random(-30, 30);
    fill(redval, grnval, bluval);
    
    float radius = random(10, 40);
    float xCenter = random(radius, width-radius);
    float yCenter = random(radius, height-radius);
    ellipse(xCenter, yCenter, radius*2, radius*2);
  } 
}
