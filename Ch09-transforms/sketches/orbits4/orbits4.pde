float SunDiam = 80;

float EarthDiam = 30;
float EarthOrbitRadius = 130;
float EarthAngle = 0;

float MoonDiam = 10;
float MoonOrbitRadius = 50;
float MoonAngle = 0;

float NemDiam = 20;
float NemOrbitRadius = 40;
float NemAngle = 0;

void setup() {
   size(600, 400);
}

void draw() {
   background(0, 0, 0);    // inky blackness of space
   translate(300, 200);    // move origin to center of screen

   noStroke();
   fill(255, 200, 64);        // yellow-orange
   ellipse(0, 0, SunDiam, SunDiam);  // the mighty Sun

   // rotate around the sun
   rotate(EarthAngle);

   // move out to Earth orbit
   translate(EarthOrbitRadius, 0);

   fill(64, 64, 255);                    // blue-ish
   rect(-EarthDiam/2, -EarthDiam/2, EarthDiam, EarthDiam); // the noble Earth

   // push this transform so we can return to it later
   pusMatrix();

   // rotate around the Earth
   rotate(MoonAngle);

   // move out to Moon orbit
   translate(MoonOrbitRadius, 0);

   fill(192, 192, 180);                    // gray-ish
   rect(-MoonDiam/2, -MoonDiam/2, MoonDiam, MoonDiam); // the friendly Moon

   // pop the stack, recovering the old transformation
   popMatrix();

   // rotate around the Earth
   rotate(NemAngle);

   // move out to Nem orbit
   translate(NemOrbitRadius, 0);

   fill(220, 75, 75);                    // red-ish
   rect(-NemDiam/2, -NemDiam/2, NemDiam, NemDiam); // the evil Nem

   EarthAngle += 0.01;
   MoonAngle += 0.01;
   NemAngle += 0.015;
}
