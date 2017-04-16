void setup() {
   size(600, 400);    
   PFont myFont = loadFont("ChaparralPro-Bold-96.vlw");
   textFont(myFont);
   
   background(240, 215, 175); 
   String message = "raspberry!";
   
   fill(145, 44, 66);
   text(message, 75, 200);
}
