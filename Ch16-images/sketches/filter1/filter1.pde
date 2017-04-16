PImage Hike;
PImage [] Results;

void setup() {
  size(1350, 1050); 
  Hike = loadImage("myPhoto.jpg");
  Results = new PImage[16];
  for (int i=0; i<16; i++) Results[i] = createImage(300, 225, RGB);
    
  for (int i=0; i<16; i++) {
    runFilter(i);
  }
  
  background(128);
  
  for (int y=0; y<4; y++) {
    for (int x=0; x<4; x++) {
      copy(Results[(y*4)+x], 0, 0, 300, 225, x*350, y*275, 300, 225);
    }
  }
}

void runFilter(int i) {
  image(Hike, 0, 0, 300, 225);
  switch (i) {
    case  0: filter(THRESHOLD, 0.25); break;
    case  1: filter(THRESHOLD, 0.75); break;
    case  2: filter(GRAY); break;
    case  3: filter(INVERT); break;
    
    case  4: filter(POSTERIZE, 2); break;
    case  5: filter(POSTERIZE, 3); break;
    case  6: filter(POSTERIZE, 4); break;
    case  7: filter(POSTERIZE, 8); break;
    
    case  8: filter(BLUR, 1); break;
    case  9: filter(BLUR, 4); break;
    case 10: filter(BLUR, 15); break;
    case 11: filter(OPAQUE); break;
    
    case 12: filter(ERODE); break;
    case 13: filter(ERODE); filter(ERODE); filter(ERODE); break;
    case 14: filter(DILATE); break;
    case 15: filter(DILATE); filter(DILATE);  filter(DILATE);  break;
    default: break;
  }
  Results[i] = get(0, 0, 300, 225);
}
    
