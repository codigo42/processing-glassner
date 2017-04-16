// Sandstorm project
// version 1.0 - AG 30 April 2009
//

boolean LoopingEnabled;  // true if draw() is being called

Grain [] Sparks;       // the Grains that fall down the screen
Wind [] Gusts;       // the winds that push them around

// Create the graphics window.  Then create the global
// arrays of Sparks and Gusts and initialize them with
// objects.  Turn on the flag that indicates we're looping.
//
void setup() {
   size(600, 400);
   int numSparks = 5000;
   Sparks = new Grain[numSparks];
   for (int i=0; i<numSparks; i++) {
      Sparks[i] = new Grain();
   }
   int numGusts = 8;
   Gusts = new Wind[numGusts];
   for (int i=0; i<numGusts; i++) {
      Gusts[i] = new Wind();
   }
   LoopingEnabled = true;
}

// Draw each Spark and update it.
// Then update all the Gusts.
void draw() {
   for (int i=0; i<Sparks.length; i++) {
      Sparks[i].render();
      Sparks[i].move();
   }
   for (int i=0; i<Gusts.length; i++) {
      Gusts[i].update();
   }
}

// If the user presses a key, stop looping if it's
// enabled, or start again if it's been stopped.
//
void keyPressed() {
   if (LoopingEnabled)  noLoop();
   else loop();
   LoopingEnabled = !LoopingEnabled;
}
