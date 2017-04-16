void setup() {
   size(600, 400);
   background(92, 39, 44);
   fill(232, 200, 72);     // draw in yellow
   PFont myFont = loadFont("Puschkin-48.vlw");
   textFont(myFont);      // make myFont the active font
   String message = "Blueberry Pie is a delicious summertime treat!";
   textLeading(40);
   textAlign(CENTER);
   text(message, 50, 100, 500, 300);
}
