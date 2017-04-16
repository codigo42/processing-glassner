import processing.opengl.*;

PImage Hike;

void setup() {
  size(600, 400, P3D); 
  Hike = loadImage("myPhoto.jpg");
  
  background(128);
  
  // tall thin rectangle
  beginShape();
  texture(Hike);
  vertex(50, 50, 0, 0);
  vertex(150, 50, 599, 0);
  vertex(150, 350, 599, 449);
  vertex(50, 350, 0, 449);
  endShape(CLOSE);
  
  // short wide rectangle
  beginShape();
  texture(Hike);
  vertex(200, 250, 0, 0);
  vertex(550, 250, 599, 0);
  vertex(550, 350, 599, 449);
  vertex(200, 350, 0, 449);
  endShape(CLOSE);
  
  // square
  beginShape();
  texture(Hike);
  vertex(300, 50,   50, 200);
  vertex(450, 50,  200, 200);
  vertex(450, 200, 200, 400);
  vertex(300, 200,  50, 400);
  endShape(CLOSE);
}
