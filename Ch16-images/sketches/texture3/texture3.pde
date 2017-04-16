import processing.opengl.*;

PImage Hike;

void setup() {
  size(600, 400, OPENGL); 
  Hike = loadImage("myPhoto.jpg");
  
  background(192);
  
  // triangle
  beginShape();
  texture(Hike);
  vertex(100, 240, 0, 400);
  vertex( 60,  60, 0, 0);
  vertex(240, 100, 600, 400);
  endShape(CLOSE);
  
  // fish
  beginShape();
  texture(Hike);
  vertex(160, 320, 0, 300);
  vertex(200, 200, 100, 400);
  vertex(280, 180, 200, 400);
  vertex(300, 100, 400, 400);
  vertex(380, 160, 600, 0);
  vertex(400, 240, 500, 0);
  vertex(320, 220, 400, 0);
  vertex(300, 300, 300, 0);
  endShape(CLOSE);
  
  // arrowhead
  beginShape();
  texture(Hike);
  vertex(420, 300,   0, 400);
  vertex(500,  60, 600, 400);
  vertex(580, 360, 600,   0);
  vertex(500, 240,  0, 0);
  endShape(CLOSE);
}
