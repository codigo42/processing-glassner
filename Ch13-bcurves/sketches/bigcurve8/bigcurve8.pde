// Draw crazy free-form Bezier curves
// Get a new big curve each time you run the sketch
// Version 1.0 - AG, 15 April 2009
//

int NumPoints = 24;   // The total number of points created
float [] Xp;          // The point X coordinates
float [] Yp;          // The point Y coordinates

// This version of setup() creates the graphics window and
// sets the background color.  It turns off filling so we
// get just the curves, not their interiors.  Then I create
// the two point arrays and fill them up with random numbers.
// From here on, Processing calls draw() automatically for 
// every new frame to generate the graphics.
//
void setup() {
   size(600, 400);
   background(206, 214, 242);
   noFill();
   Xp = new float[NumPoints];
   Yp = new float[NumPoints];
   for (int i=0; i<NumPoints; i++) {
      Xp[i] = random(100, 500);
      Yp[i] = random(100, 300);
   }
}


// This version of draw() takes two arrays full of random
// points and turns them into a single closed Bezier curve.
// Input parameters: none
// Output parameters: none
// Global variables used:
//        NumPoints : the number of points in arrays Xp and Yp
//        Xp[]      : float array of point's x coordinates
//        Yp[]      : float array of point's y coordinates
// Side effects: draws the curve on the screen
// Version 1.0 - AG, 15 April 2009
//
void draw() {
   // The points need to be turned into a list of 4-element
   // Bezier curves.  First, to get the curves to touch and
   // thus be continuous, we set the first point of each
   // curve to the coordinates of the last point of the
   // preceding curve.  The first curve is handled as a
   // special case after the loop.
   for (int i=4; i<NumPoints; i+=4) {
      Xp[i] = Xp[i-1];
      Yp[i] = Yp[i-1];
   }
   Xp[0] = Xp[NumPoints-1];
   Yp[0] = Yp[NumPoints-1];
  
   // To create a continuous curve, we need to enforce the
   // mathematical constraint that the change in X between
   // the first two points of each curve is equal to the
   // change in X between the last two points of the previous
   // curve, and the same thing in Y.  The first curve is
   // handled as a special case after the loop.
   for (int i=5; i<NumPoints; i+=4) {
      Xp[i] = Xp[i-1] + (Xp[i-2] - Xp[i-3]);
      Yp[i] = Yp[i-1] + (Yp[i-2] - Yp[i-3]);
   }
   Xp[1] = Xp[0] + (Xp[NumPoints-1] - Xp[NumPoints-2]);
   Yp[1] = Yp[0] + (Yp[NumPoints-1] - Yp[NumPoints-2]);

   // Draw a little circle around the first point of
   // each curve.  The default drawing state makes this
   // a white circle with a black outline, which looks good.
   for (int i=0; i<NumPoints; i+=4) {
      ellipse(Xp[i], Yp[i], 10, 10);
   }
  
   // Run through the lists of points, taking them 4 at a
   // time.  Hand off each batch of 4 to bezier().  By now,
   // they should all touch and join up smoothly.
   for (int i=0; i<NumPoints; i+=4) {
      bezier(Xp[i],   Yp[i],   Xp[i+1], Yp[i+1],
             Xp[i+2], Yp[i+2], Xp[i+3], Yp[i+3]);
   }
}
