void setup() {
   size(600, 400);
   background(92, 39, 44);
   float xText = 100;
   float yText = 200;
   float border = 25;

   PFont myFont = loadFont("Times-Roman-48.vlw");
   textFont(myFont);      // make myFont the active font

   String message = "Blueberry Pie!";
   float textWid = textWidth(message);
   float textUpper = textAscent();
   float textLower = textDescent();
   float textHeight = textLower + textUpper;

   xText = (width/2.0) - (textWid/2.0);
   yText = (height/2.0) + (textHeight/2.0);

   noStroke();
   fill(60, 55, 196);      // the blue box
   float rectTop = yText - textUpper - border;
   float rectHgt = textHeight + 2*border;
   rect(xText-border, rectTop, textWid+2*border, rectHgt);
   fill(232, 200, 72);     // draw in yellow
   text(message, xText, yText);
   noLoop();
}
