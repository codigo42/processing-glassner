import processing.opengl.*;

int Window = 600;
int GridX = 13;
int GridZ = 10;
Greeble Ggrid[][];

class Greeble {
   float tx, tz;
   float angleY;
   float angleZ;
   
   Greeble(int x, int z) {
     tx = x-(GridX/2.0);
     tz = z-(GridZ/2.0);    
     int i4 = int(random(0, 1000))%4;
     angleY = radians(i4*90);
     angleZ = radians(3.0*(x-(GridX/2.0)));
   }
         
   void render() {
      pushMatrix();
         translate(tx, 0, tz);
         translate(.5, 0, .5);
         rotateZ(angleZ);
         rotateY(angleY);
         translate(-.5, 0, -.5);
         
         drawBox(.5, -.1, .5, 1, .1, 1);
         drawSphere(.4, 0, .35, .2);
         drawBox(.3, 0, .05, .2, .1, .1);
         drawBox(.25, 0, .75, .2, .05, .15);
         drawBox(.75, 0, .25, .1, .1, .1);
         drawBox(.75, 0, .4, .1, .1, .1);
         drawBox(.75, 0, .55, .1, .1, .1);
         drawBox(.9,  0, .8,  .2, .15, .25);
         drawBox(.55, 0, .8,  .08, .2, .22);
      popMatrix();
   }
}

void setup(){
   size(Window, Window, OPENGL);
   smooth();
   Ggrid = new Greeble[GridZ][GridX];
   for (int z=0; z<GridZ; z++) {
     for (int x=0; x<GridX; x++) {
       Ggrid[z][x] = new Greeble(x, z);
     }
   }
}

void draw() {
   background(25, 42, 51);
   translate(Window/2.0, Window/2.0, -400.0);
   scale(Window, -Window, Window);
   lights();

   noStroke();
   fill(255, 255, 200);
   rotateX(radians(35));
   float gScale = 0.2;
   scale(gScale);

   for (int iz=0; iz<GridZ; iz++) {
      for (int ix=0; ix<GridX; ix++) {
         Ggrid[iz][ix].render(); 
      }
   }
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
