void setup() {
   size(600, 400);    
   PFont myFont = loadFont("ChaparralPro-Bold-96.vlw");
   textFont(myFont);
   
   background(240, 215, 175); 
   String message = "raspberry!";
   float messageWidth = textWidth(message);
   int xheight = getXHeight();
   
   // top stripe
   fill(189, 176, 130);
   rect(75, 200-textAscent(), messageWidth, textAscent()-xheight); 
   
   // center stripe
   fill(126, 189, 152);
   rect(45, 200, messageWidth+60, -xheight);
   
   // bottom stripe
   fill(145, 185, 189);
   rect(15, 200, messageWidth+120, textDescent()); 
   
   
   fill(145, 44, 66);
   text(message, 75, 200);
}

int getXHeight() {
  return(25);
}
