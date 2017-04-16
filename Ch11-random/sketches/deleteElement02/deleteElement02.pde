void setup() {
   int [] ia = { 0, 1, 2, 3, 4, 5, 6, 7, 8 };
   print("ia before deleting: ");
   printArray(ia);
   int [] ib = deleteElement(ia, 4);
   print("ia after deleting:  ");
   printArray(ia);
   print("ib:                 ");
   printArray(ib);
   
   
   float [] fa = { 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 };
   print("fa before deleting: ");
   printArray(fa);
   float [] fb = deleteElement(fa, 4);
   print("fa after deleting:  ");
   printArray(fa);
   print("fb:                 ");
   printArray(fb);
}

void printArray(int [] array) {
   for (int i=0; i<array.length; i++) {
      print(array[i]+" ");
   }
   print("\n");
}

void printArray(float [] array) {
   for (int i=0; i<array.length; i++) {
      print(array[i]+" ");
   }
   print("\n");
}
  
int [] deleteElement(int [] array, int num) {   
   int [] s1 = subset(array, 0, num-1);              // get 1st part
   int [] s2 = subset(array, num, array.length-num); // get 2nd part
   int [] result = concat(s1, s2);                   // combine parts
   return(result);
}

float [] deleteElement(float [] array, int num) {
   float [] s1 = subset(array, 0, num-1);              // get 1st part
   float [] s2 = subset(array, num, array.length-num); // get 2nd part
   float [] result = concat(s1, s2);                   // combine parts
   return(result);
}
