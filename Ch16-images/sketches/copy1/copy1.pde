PImage MyPic;
void setup() {
  size(600, 450); 
  MyPic = loadImage("myPhoto.jpg");
  background(0);
}

void draw() {
  float sulx = random(width);
  float suly = random(height);
  float swid = random(width-sulx);
  float shgt = random(height-suly);
  float dulx = sulx + random(-30, 30);
  float duly = suly + random(-30, 30);
  float dwid = swid + random(-30, 30);
  float dhgt = shgt + random(-30, 30);
  
  copy(MyPic, int(sulx), int(suly), int(swid), int(shgt), 
              int(dulx), int(duly), int(dwid), int(dhgt));
}

