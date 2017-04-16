void setup() 
{
  size(600, 400);
  PFont MyFont = loadFont("ArnoPro-Bold-48.vlw");
  textFont(MyFont);
}

void draw() {
   fill(199, 172, 115);
   background(89, 9, 21);
   String message = "Pomegranate and lime juice";
   int numChars = message.length();
   for (int i=0; i<numChars; i++) {
      char thisChar = message.charAt(i);
      text(thisChar, 10+(10*i), 200+(10*i));
   }
}
