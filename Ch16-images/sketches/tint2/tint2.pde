void setup() {
  size(600, 450); 
  background(0);
  noStroke();
  fill(255);
  rect(0, 0, width/2, height);
  PImage myPhoto = loadImage("myPhoto.jpg");
  tint(255, 255, 0, 128);
  image(myPhoto, 0, 0);
}

