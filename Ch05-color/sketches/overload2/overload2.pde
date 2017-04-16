void setup() {
   float len = findSize(3);
   println("len 3 = "+len);
   float flen = findSize(3.0);
   println("len 3.0 = "+flen);

}

float findSize(float len) {  // return the input
   return(len);
}

float findSize(int len) {  // return the input * 5
   return(len*5);
}
