import processing.pdf.*;

void setup() {
  size(600, 400);
  recordPNG();
  recordPDF();
}

void recordPNG() {
  drawPicture();
  save("pixels.png");
}

void recordPDF() {
  beginRecord(PDF, "commands.pdf");
  drawPicture();
  endRecord();
}

void drawPicture() {
  strokeWeight(1);
  background(181, 86, 70);
  fill(212, 201, 143);
  ellipse(200, 200, 100, 150);
  strokeWeight(8);
  fill(214, 192, 178);
  ellipse(400, 200, 50, 180);
}
