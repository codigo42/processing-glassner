import processing.opengl.*;

int Window = 600;

void setup(){
   size(Window, Window, OPENGL);
}

void draw() {
   background(25, 42, 51);
   translate(Window/2.0, Window/2.0, -400.0);
   scale(Window, -Window, Window);
   lights();

   noStroke();
   fill(255);
   rotateX(radians(35));
   float gScale = 0.5;
   scale(gScale);

   drawGreeble00(); 
}

void drawGreeble00() {
   drawBox(.5, -.1, .5, 1, .1, 1);
   drawSphere(.4, 0, .35, .2);
   drawBox(.3, 0, .05, .2, .1, .1);
   drawBox(.25, 0, .75, .2, .05, .15);
   drawBox(.75, 0, .25, .1, .1, .1);
   drawBox(.75, 0, .4, .1, .1, .1);
   drawBox(.75, 0, .55, .1, .1, .1);
   drawBox(.9,  0, .8,  .2, .15, .25);
   drawBox(.55, 0, .8,  .08, .2, .22);
}

void drawSphere(float cx, float cy, float cz, float r)
{
   pushMatrix();
   translate(cx, cy, cz);
   sphere(r);
   popMatrix();
}

void drawBox(float cx, float cy, float cz, float dx, float dy, float dz)
{
   pushMatrix();
   translate(cx, cy+(dy/2.0), cz);
   box(dx, dy, dz);
   popMatrix();
}
