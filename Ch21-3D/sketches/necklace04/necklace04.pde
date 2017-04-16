import processing.opengl.*;

void setup() {
   size(600, 400, OPENGL);
}

void draw() {
   background(180, 219, 180);
   lights();
   camera();
   translate(width/2, height/2, 0.0);
   scale(height/2);
  
   fill(50, 106, 102);
   sphere(0.5);
  
   fill(226, 125, 156);
   translate(0.75, 0, 0);
   drawBead();
}

void drawBead() {
   beginShape();
   vertex(-.1, -.2, 0);
   vertex( .1, -.2, 0);
   vertex( .1,  .2, 0);
   vertex(-.1,  .2, 0);
   endShape(CLOSE);
}  
