int NumSlices = 12;
PImage Slices[];
PVector SliceOrigins[];

void setup() {
   size(600, 400, P2D);
   Slices = new PImage[NumSlices];
   SliceOrigins = new PVector[NumSlices];
   buildSlices();
}

void draw() {
   background(0, 0, 0);
   for (int slice=NumSlices-1; slice>=0; slice--) {
      SliceOrigins[slice].x += .02;
      SliceOrigins[slice].y += .02;
      int offx = int(lerp(-5, 5, noise(SliceOrigins[slice].x)));
      int offy = int(lerp(-5, 5, noise(SliceOrigins[slice].y)));
      blend(Slices[slice], 0, 0, width, height, offx, offy, width, height, ADD); 
   }
}

void buildSlices() {
   float [][] noiseField = new float[height][width];
   color sliceColor;
   color orangeColor = color(255, 127, 0, 255); // opaque orange
   color blueColor = color(40, 41, 128, 255);   // opaque blue
   color blackColor = color(0, 0, 0, 0);        // transparent black
   
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         noiseField[y][x] = noise(x*0.015, y*0.015);
      }
   }
   
   PGraphics layer = createGraphics(width, height, P2D);
   for (int slice=0; slice<NumSlices; slice++) {
      layer.beginDraw();
      layer.background(blackColor);
      float lerpVal = slice*1.0/(NumSlices-1);
      sliceColor = lerpColor(orangeColor, blueColor, lerpVal);
      float minVal = slice * 1.0 / NumSlices;
      float maxVal = (slice+1) * 1.0 / NumSlices;
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            float noiseVal = noiseField[y][x];
            if ((noiseVal >= minVal) && (noiseVal <= maxVal)) {
               layer.set(x, y, sliceColor);
            }
         }
      }
      layer.endDraw();
      Slices[slice] = layer.get(0, 0, width, height);
      SliceOrigins[slice] = new PVector(random(slice*100), random((slice+1)*100));
   }
}
