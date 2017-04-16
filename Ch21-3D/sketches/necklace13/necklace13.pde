import processing.opengl.*;

void setup() {
   size(600, 400, OPENGL);
}

void draw() {
   background(180, 219, 180);
   lights();
   camera();
   rotateX(radians(-30));
   translate(width/2, height/2, 0.0);
   scale(height/2);
   
   fill(50, 106, 102);
   sphere(0.5);
  
   fill(226, 125, 156);
   
   int numBeads = 250;
   for (int i=0; i<numBeads; i++) {
      float a = map(i, 0, numBeads-1, 0, 1);
       pushMatrix();
          rotateY(radians(a * 360));
          translate(1.1, 0, 0);
          rotateZ(radians(a*2*360) + (.02 * frameCount));
          drawBead();
       popMatrix();
   }
}

void drawBead() {
   beginShape();
   vertex(-.1, -.2, 0);
   vertex( .1, -.2, 0);
   vertex( .1,  .2, 0);
   vertex(-.1,  .2, 0);
   endShape(CLOSE);
}  
