import processing.opengl.*;

int Window = 600;
int GridX = 13;
int GridZ = 10;

void setup(){
   size(Window, Window, OPENGL);
   smooth();
}

void draw() {
   background(25, 42, 51);
   translate(Window/2.0, Window/2.0, -400.0);
   scale(Window, -Window, Window);
   lights();

   noStroke();
   fill(255);
   rotateX(radians(35));
   float gScale = 0.2;
   scale(gScale);

   for (int iz=0; iz<GridZ; iz++) {
      for (int ix=0; ix<GridX; ix++) {
         pushMatrix();
         translate(ix-(GridX/2.0), 0, iz-(GridZ/2.0));
         translate(.5, 0, .5);
         rotateZ(radians(5.0*(ix-(GridX/2.0))));
         translate(-.5, 0, -.5);
         drawGreeble00(); 
         popMatrix();
      }
   }
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
