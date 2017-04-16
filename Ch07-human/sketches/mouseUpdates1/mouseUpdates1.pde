void setup() {
  size(600, 400);
  frameRate(1);
}

void draw() {
  println("=======================");
  println("draw!  mouse = "+mouseX+" "+mouseY);
  println("      pmouse = "+pmouseX+" "+pmouseY);
}

void mouseMoved() {
  println("moved!  mouse = "+mouseX+" "+mouseY);
  println("       pmouse = "+pmouseX+" "+pmouseY);
}


