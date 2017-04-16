import processing.opengl.*;

int Window = 600;
int GridX = 13;
int GridZ = 10;
Greeble Ggrid[][];

class Greeble {
   float tx, tz;
   float angleY;
   float angleZ;
   int tileType;
   
   Greeble(int x, int z) {
     tx = x-(GridX/2.0);
     tz = z-(GridZ/2.0);    
     int i4 = int(random(0, 1000))%4;
     angleY = radians(i4*90);
     angleZ = radians(3.0*(x-(GridX/2.0)));
     tileType = int(random(0, 1000))%4;
   }
         
   void render() {
      pushMatrix();
         translate(tx, 0, tz);
         translate(.5, 0, .5);
         rotateZ(angleZ);
         rotateY(angleY);
         translate(-.5, 0, -.5);
         
         switch (tileType) {
            case 0: drawGreeble00(); break;
            case 1: drawGreeble01(); break;
            case 2: drawGreeble02(); break;
            case 3: drawGreeble03(); break;
            default: drawGreeble03(); break;
         }
      popMatrix();
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

   void drawGreeble01() {
      drawBox(.5, -.1, .5, 1, .1, 1);
      drawCone(.625, 0, .32, .23, .14, .35, 20, true);
      drawBox(.85, 0, .3, .3, .1, .2);
      drawBox(.25, 0, .2, .15, .2, .4);
      drawBox(.25, 0, .7, .3, .15, .2);
      drawBox(.325, 0, .9, .15, .15, .1);
      drawBox(.725, 0, .8, .025, .1, .22);
      drawBox(.775, 0, .8, .025, .1, .22);
      drawBox(.825, 0, .8, .025, .1, .22);
   }
   
   void drawGreeble02() {
      drawBox(.5, -.1, .5, 1, .1, 1);
      drawCone(.12, 0, .37, .11, 0, .25, 10, false);
      drawCone(.2, 0, .6, .11, 0, .25, 10, false);
      drawCone(.4, 0, .71, .11, 0, .25, 10, false);
      drawCone(.62, 0, .65, .11, 0, .25, 10, false);
      drawSphere(.45, 0, .35, .2);
      drawBox(.4, 0, .3, .1, .05, .4);
      drawBox(.55, 0, .15, .3, .05, .1);
      drawBox(.85, 0, .35, .1, .25, .2);
      drawBox(.35, 0, .925, .5, .1, .15);
      drawBox(.8, 0, .825, .2, .075, .05);
      drawBox(.925, 0, .925, .05, .075, .15);
   }
   
   void drawGreeble03() {
      drawBox(.5, -.1, .5, 1, .1, 1);
      drawBox(.425, 0, .6, .4, .1, .4);
      drawBox(.425, 0, .6, .3, .2, .3);
      drawBox(.425, 0, .6, .2, .3, .2);
      drawBox(.425, 0, .6, .1, .4, .1);
      drawBox(.35, 0, .9, .1, .05, .2);
      drawCone(.175, 0, .9, .05, 0, .15, 15, false);
      drawCone(.475, 0, .9, .05, 0, .15, 15, false);
      drawBox(.8, 0, .625, .2, .03, .03);
      drawBox(.8, 0, .675, .2, .03, .03);
      drawBox(.8, 0, .725, .2, .03, .03);
      drawBox(.8, 0, .775, .2, .03, .03);
      drawBox(.8, 0, .825, .2, .03, .03);
      drawSphere(.8, 0, .275, .05);
      drawSphere(.8, 0, .425, .05);
      drawBox(.9, 0, .075, .1, .1, .15);
      drawBox(.3, 0, .2, .4, .1, .2);
      drawBox(.075, 0, .175, .05, .05, .05);
      drawBox(.025, 0, .35, .05, .1, .5);
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

void drawCone(float cx, float cy, float cz, float rLo, float rHi, float yTop, int res, boolean cap)
{
   pushMatrix();
   translate(cx, cy, cz);
   beginShape(QUAD_STRIP);
   for (int i=0; i<=res; i++) {
      float theta = radians(map(i, 0, res, 0, 360));
      vertex(rLo*cos(theta),  0.0, rLo*sin(theta));
      vertex(rHi*cos(theta), yTop, rHi*sin(theta));
   }
   endShape();
   if (cap) {
      beginShape(TRIANGLE_FAN);
      vertex(0, yTop, 0);
      for (int i=0; i<=res; i++) {
         float theta = radians(map(i, 0, res, 0, 360));
         vertex(rHi*cos(theta), yTop, rHi*sin(theta));
      }
      endShape();
   }
   popMatrix();
}

