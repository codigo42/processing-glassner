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
   text(message, 10, 200);
}
