void setup() {
   size(600, 400);
   background(92, 39, 44);
   float xText = 100;
   float yText = 200;
   float border = 25;
  
   PFont myFont = loadFont("Puschkin-48.vlw");
   textFont(myFont);      
  
   String message = "Blueberry Pie!";
   float textWid = textWidth(message);  // find the message width
  
   fill(60, 55, 196);   // blue color
   rect(xText-border, yText-100, textWid+2*border, 200);
   fill(232, 200, 72);     // draw type in yellow
   text(message, xText, yText);
   noLoop();
}
