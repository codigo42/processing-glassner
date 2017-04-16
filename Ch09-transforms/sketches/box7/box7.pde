void setup() {
   size(600, 400);
}

void draw() {
   background(210, 177, 68);
   stroke(0);
   noFill();
   
   strokeWeight(2);
   drawCircleTo(150, 100);
   drawCircleTo(400, 100);
   drawCircleTo(400, 250);
   drawCircleTo(150, 250);
   strokeWeight(1);
   
   fill(149, 93, 13, 128);
   rect(150, 100, 250, 150);    
   fill(139, 49, 30, 128);
   
   translate(300, 200);
   rotate(radians(20));
   
   rect(150, 100, 250, 150);
}

void drawCircleTo(float x, float y) {
   float r = dist(0, 0, x, y);
   ellipse(0, 0, 2*r, 2*r);
}
