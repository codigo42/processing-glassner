void setup() 
{
  size(600, 400);
  PFont MyFont = loadFont("ArnoPro-Bold-48.vlw");
  textFont(MyFont);
}

void draw() {
   fill(199, 172, 115);
   background(89, 9, 21);
   String message = "Pomegranate and lime juice ";
   float radius = 150;
   int numChars = message.length();
   for (int i=0; i<numChars; i++) {
      char thisChar = message.charAt(i);
      float theta = map(i, 0, numChars, radians(0), radians(360));
      theta -= frameCount * .01;
      float xpos = 300 + (radius * cos(theta));
      float ypos = 200 - (radius * sin(theta));
      text(thisChar, xpos, ypos);
   }
}
