void setup() {
  size(600, 600);
  background(0);
  smooth();
  translate(300, 300);
  for (float i=0; i<360; i += 0.5) {  // bump by .5 for ellipses, 1 for others
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    rotate(radians(i*3));
    scale(map(sin(radians(i*6)), -1, 1, .5, 1), map(sin(radians(i*3)), -1, 1, .5, 1));
    drawEllipse();
    popMatrix();
  }
}

void drawRect() {
  noFill();
  stroke(255, 255, 255, 128);
  rect(-60, -40, 120, 80);
  //rect(60, 40, 120, 80);
}  

void drawEllipse() {
  noFill();
  stroke(255, 255, 255, 128);
  ellipse(0, 0, 120, 80);
}

void drawStar() {
  float r1 = 40;
  float r2 = 120;
  int numPoints = 3;
  float dTheta = radians(360)/(numPoints * 2.0);
  for (int i=0; i<numPoints; i++) {
     float x0 = r1 * cos((2*i)*dTheta);
     float y0 = r1 * sin((2*i)*dTheta);
     float x1 = r2 * cos(((2*i)+1) * dTheta);
     float y1 = r2 * sin(((2*i)+1) * dTheta);
     float x2 = r1 * cos(((2*i)+2) * dTheta);
     float y2 = r1 * sin(((2*i)+2) * dTheta);
     noFill();
     stroke(255, 255, 255, 128);
     line(x0, y0, x1, y1);
     line(x1, y1, x2, y2);
  }
}
