PImage Picture;
PrintWriter OutputFile;

void setup() {
   size(1600, 630);
   Picture = loadImage("../oddman.png");
   image(Picture, 0, 0);
   OutputFile = createWriter("DrawingPoints.txt");
}

void mouseClicked() {
   OutputFile.println(mouseX + "\t" + mouseY);
}

void keyPressed() {
   if ((key == 'q') || (key == 'Q')) {
      println("is Q");
      OutputFile.flush();
      OutputFile.close();
      exit();
   }
}
