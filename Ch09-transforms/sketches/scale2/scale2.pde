void setup() {
   size(600, 400);
}

void draw() {
   background(210, 177, 68);
   stroke(0);
   noFill();
   
   // move the origin to the center of the screen
   translate(300, 200);
   scale(0.5);
   
   strokeWeight(2);
   drawCircleTo( 125,  75);
   drawCircleTo( 125, -75);
   drawCircleTo(-125,  75);
   drawCircleTo(-125, -75);
   strokeWeight(1);
   
   fill(149, 93, 13, 128);
   rect(-125, -75, 250, 150);    
   fill(139, 49, 30, 128);
   
   rotate(radians(20));
   
   rect(-125, -75, 250, 150);
}

void drawCircleTo(float x, float y) {
   float r = dist(0, 0, x, y);
   ellipse(0, 0, 2*r, 2*r);
}
