float EaseX, EaseY;

void setup() {
  size(1500, 400);
  background(0);
  smooth();
  stroke(55, 80, 80);
  fill(55, 80, 80);
  frameRate(30);
}

void draw() {
  background(230, 255, 180);
  int runLength = 60;
  //if (frameCount > runLength) return;
  int fc = frameCount % runLength;
  float t = map(fc, 0, runLength, 0, 1);
  drawCars(t);  
}

// track runs from 150 to 1400, cars at Y=200 and 400
void drawCars(float t) {
  float tx, ty;
  
  // linear drive
  pushMatrix();
  tx = lerp(150, 1400, t);
  translate(tx, 200);
  drawCar();
  popMatrix();
  
  // ease drive
  pushMatrix();
  ty = (3*t*t)-(2*t*t*t); // another form of ease curve
  tx = 150 + 1250 * ty;
  translate(tx, 400);
  drawCar();
  popMatrix();
}
  
float [] carBody = {
   1.72, 5.29,   1.35, 5.32,   1.16, 5.40,   1.16, 5.67,
   1.28, 6.01,   1.53, 6.24,   2.14, 6.46,   3.10, 6.61,
   3.94, 7.05,   4.66, 7.15,   5.32, 7.10,   6.05, 6.94,
   6.75, 6.78,   7.01, 6.73,   7.27, 6.75,   7.33, 6.67,
   7.26, 6.58,   7.31, 6.25,   7.40, 6.19,   7.43, 5.89,
   7.44, 5.59,   7.36, 5.53,   6.74, 5.40,   6.75, 5.72,
   6.55, 5.94,   6.22, 6.07,   5.90, 5.96,   5.69, 5.64,
   5.70, 5.38,   2.78, 5.32,   2.75, 5.69,   2.50, 5.98,
   2.19, 6.05,   1.88, 5.95,   1.70, 5.57
};

void drawCar() {
  pushMatrix();
  scale(-20, -20);
  strokeWeight(.1);
  translate(-3.14, -0.93);
  int cbl = carBody.length;
  for (int i=0; i<cbl; i+=2) {
    line(carBody[i], carBody[i+1], carBody[(i+2)%cbl], carBody[(i+3)%cbl]);
  }
  ellipse(2.21, 5.55, 0.70, 0.70);
  ellipse(6.23, 5.55, 0.70, 0.70);
  popMatrix();
}  

float getEase(float x, float easeA) {
  if (easeA >= 0) return(findBez(x, easeA));
  else return(1-findBez(1-x, -easeA));
}

float findBez(float x, float easeA) {
  float maxError = 0.0001;
  int maxSteps = 100;
  int stepCount = 0;
  
  float error = 100;
  float tleft = 0;
  float tright = 1;
  float xleft = 0;
  float yleft = 0;
  float xright = 1;
  float yright = 1;
  while ((abs(error) > maxError) && (stepCount++ < maxSteps)) {
    
    float tmid = (tleft+tright)/2;
    float b0x = 0;        float b0y = 0;
    float b1x = easeA;    float b1y = 0;
    float b2x = 1-easeA;  float b2y = 1-easeA;
    float b3x = 1;        float b3y = 1;
    float xmid = bezierPoint(b0x, b1x, b2x, b3x, tmid);
    float ymid = bezierPoint(b0y, b1y, b2y, b3y, tmid);
    if (x < xmid) {
      xright = xmid;
      yright = ymid;
      tright = tmid;
    } else {
      xleft = xmid;
      yleft = ymid;
      tleft = tmid;
    }
    error = yright - yleft;
  }
  float bx = (xleft+xright)/2;
  float by = (yleft+yright)/2;
  return(by);
}

float getEaseInOut(float t, float easeA) {
  float v;
  if (t < 0.5) {
    v = getEase(2*t, easeA);
    return(v/2);
  } else {
    v = getEase(2*(t-.5), -easeA);
    return(0.5 + (v/2));
  }
}
