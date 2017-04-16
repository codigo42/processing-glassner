PImage Picture;
PrintWriter OutputFile;

void setup() {
   size(1600, 630);
   Picture = loadImage("../oddman.png");
   image(Picture, 0, 0);
   OutputFile = createWriter("DrawingPoints.txt");
   fill(255, 0, 0);
   noStroke();
}

void draw() {
}

void mouseClicked() {
   OutputFile.println(mouseX + "\t" + mouseY);
   ellipse(mouseX, mouseY, 3, 3);
}

void keyPressed() { 
  if (key == 'z') {
    OutputFile.println("ERROR!");
    return;
  }
  OutputFile.flush(); 
  OutputFile.close(); 
  exit(); 
}
