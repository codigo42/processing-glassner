void setup() {
   float length = findSize(3);
   println("length = "+length);
   float area = findSize(4, 6);
   println("area = "+area);
   float volume = findSize(2, 3, 5);
   println("volume = "+volume);
}

float findSize(float length) {  // 1D size - just returns the input length
   return(length);
}

float findSize(float width, float height) { // 2D size - return area
   return(width*height);
}

float findSize(float width, float height, float depth) { // 3D size - return volume
   return(width*height*depth);
}
