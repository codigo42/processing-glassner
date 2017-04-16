PGraphics Background;

int Window = 480;       // size of the graphics window
float Cx = Window/2.0;  // center x
float Cy = Window/2.0;  // center y

int NumRings = 3;       // number of circles around the center
float RingLo = 0.3;     // percentage of window for first radius
float RingHi = 0.9;     // percentage of window for last radius

int NumLines = 8;          // how many radial lines 
float RadialLineLo = 0.2;  // percentage of window where they start
float RadialLineHi = 0.9;  // percentage of window where they end

int NumHashMarks = 360;    // number of little hash marks around outside
float HashLineLo = 0.9;    // percentage of window where they start
float HashLineHi = 0.95;   // percentage of window where they end

color BrightGreen = color(140, 215, 85);  // bright-green color

void setup() {
   size(Window, Window, P2D);
   smooth();
   makeBackground();          // create the background
}

void draw() {
   image(Background, 0, 0);   // draw the background
}

void makeBackground() {
   Background = createGraphics(Window, Window, P2D);
   Background.beginDraw();
   Background.smooth();
   Background.background(24, 44, 18);   //dark green background

   // draw background grid
   Background.stroke(42, 94, 30);
   Background.strokeWeight(1);
   float lineGap = (Window/16.0);
   Background.noFill();
   for (int i=1; i<16; i++) {
      Background.line(0, i*lineGap, Window, i*lineGap);
      Background.line(i*lineGap, 0, i*lineGap, Window);
   }

   // draw inner graphics
   Background.stroke(red(BrightGreen), green(BrightGreen), blue(BrightGreen));
   Background.strokeWeight(2);

   // inner rings
   float diameter;
   for (int ring=0; ring<NumRings; ring++) {
      diameter = Window * lerp(RingLo, RingHi, ring*1.0/(NumRings-1));
      Background.ellipse(Cx, Cy, diameter, diameter);
   }

   // radial lines
   for (int lineCount=0; lineCount<NumLines; lineCount++) {
      float theta = radians(360.0 * lineCount/NumLines);
      float r0 = RadialLineLo * (Window/2.0);
      float r1 = RadialLineHi * (Window/2.0);
      Background.line(Cx+(r0*cos(theta)), Cy+(r0*sin(theta)),
                      Cx+(r1*cos(theta)), Cy+(r1*sin(theta)));
   }

   // outer hash marks
   for (int lineCount=0; lineCount<NumHashMarks; lineCount++) {
      float theta = radians(360.0 * lineCount/NumHashMarks);
      float r0 = HashLineLo * (Window/2.0);
      float r1 = HashLineHi * (Window/2.0);
      Background.line(Cx+(r0*cos(theta)), Cy+(r0*sin(theta)),
                      Cx+(r1*cos(theta)), Cy+(r1*sin(theta)));
   }

   Background.endDraw();
}
