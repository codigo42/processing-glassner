PImage Hike, Rock;

void setup() {
  size(1350, 1050); 
  Hike = loadImage("mountains300.jpg");
  Rock = loadImage("rocks300.jpg");
  
  background(128);
  
  for (int y=0; y<4; y++) {
    for (int x=0; x<4; x++) {
      showPictures(x, y);
    }
  }
}

void showPictures(int x, int y) {
  int ulx = x * 350;
  int uly = y * 275;
  image(Hike, ulx, uly, 300, 225);
  switch ((y*4)+x) {
    case  0: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, BLEND); break;
    case  1: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, ADD); break;
    case  2: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, SUBTRACT); break;
    case  3: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, DARKEST); break;
    
    case  4: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, LIGHTEST); break;
    case  5: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, DIFFERENCE); break;
    case  6: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, EXCLUSION); break;
    case  7: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, MULTIPLY); break;
    
    case  8: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, SCREEN); break;
    case  9: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, OVERLAY); break;
    case 10: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, HARD_LIGHT); break;
    case 11: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, SOFT_LIGHT); break;
    
    case 12: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, DODGE); break;
    case 13: blend(Rock, 0, 0, 300, 225, ulx, uly, 300, 225, BURN); break;
    case 14: tint(255, 255, 0); image(Rock, ulx, uly, 300, 225); noTint(); break;
    case 15: tint(255, 128);    image(Rock, ulx, uly, 300, 225); noTint(); break;
    default: break;
  }
}
    
