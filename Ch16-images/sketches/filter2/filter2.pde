PImage Hike;
PImage [] Results;

void setup() {
  size(1350, 1050); 
  Hike = loadImage("myPhoto.jpg");
  Results = new PImage[16];
  for (int i=0; i<16; i++) {
    Results[i] = createImage(300, 225, RGB);
  }
  
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
    case  0: filter(THRESHOLD, 0.5); break;
    case  1: filter(BLUR, 1);  filter(THRESHOLD, 0.5); break;
    case  2: filter(BLUR, 5);  filter(THRESHOLD, 0.5); break;
    case  3: filter(BLUR, 15); filter(THRESHOLD, 0.5); break;
    
    case  4: filter(POSTERIZE, 4); break;
    case  5: filter(BLUR, 1);  filter(POSTERIZE, 4); break;
    case  6: filter(BLUR, 5);  filter(POSTERIZE, 4); break;
    case  7: filter(BLUR, 15); filter(POSTERIZE, 4); break;
    
    case  8: multiErode(3);   filter(POSTERIZE, 4); break;
    case  9: multiDilate(3);  filter(POSTERIZE, 4); break;
    case 10: multiErode(3);   multiDilate(3);   break;
    case 11: multiDilate(3);  multiErode(3);  break;
    
    case 12: filter(BLUR, 3);  multiErode(3); break;
    case 13: filter(BLUR, 3);  multiDilate(3); break;
    case 14: filter(BLUR, 3);  multiErode(8); break;
    case 15: filter(BLUR, 3);  multiDilate(8); break;
    default: break;
  }
  Results[i] = get(0, 0, 300, 225);
}

void multiDilate(int repeats) { for (int i=0; i<repeats; i++) filter(DILATE); }
void multiErode(int repeats) { for (int i=0; i<repeats; i++) filter(ERODE); }
    
