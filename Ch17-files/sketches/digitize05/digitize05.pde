PImage Picture;
PrintWriter OutputFile;

void setup() {
   size(1600, 630);
   Picture = loadImage("../oddman.png");
   image(Picture, 0, 0);
   OutputFile = createWriter("DrawingPoints.txt");
}

void draw() {
}

void mouseClicked() {
   OutputFile.println(mouseX + "\t" + mouseY);
}

void keyPressed() {
   println("the key is "+key);
   if ((key == 'q') || (key == 'Q')) {
      OutputFile.flush();
      OutputFile.close();
      exit();
   }
}
