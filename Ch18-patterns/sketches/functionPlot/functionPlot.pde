int WindowSize = 400;
int MinimumX = -1;
int MaximumX =  1;

void setup() {
   size(WindowSize, WindowSize);
   background(255);

   int border = 20;                      // border around the plot
   int windowMin = border;               // left and bottom
   int windowMax = WindowSize - border;  // right and top

   // draw the box around the plot
   noFill();
   stroke(0, 0, 0);
   rect(windowMin, windowMin, windowMax-windowMin, windowMax-windowMin);

   // run through the function and find the output range
   float yMin = plotFunction(MinimumX);
   float yMax = yMin;
   for (int screenX=windowMin; screenX<windowMax; screenX++) {
      float xValue = map(screenX, windowMin, windowMax, MinimumX, MaximumX);
      float yValue = plotFunction(xValue);
      if (yValue < yMin) yMin = yValue;
      if (yValue > yMax) yMax = yValue;
   }

   // now run through the values again, and plot them
   float oldx = 0;
   float oldy = 0;
   for (int screenX=windowMin; screenX<windowMax; screenX++) {
      float xValue = map(screenX, windowMin, windowMax, MinimumX, MaximumX);
      float yValue = plotFunction(xValue);
      
      float screenY = map(yValue, yMin, yMax, windowMax, windowMin);
      if (screenX > windowMin) {
         line(oldx, oldy, screenX, screenY);
      }
      oldx = screenX;
      oldy = screenY;
   }
}

float plotFunction(float x)
{
   return(x*x);
}
