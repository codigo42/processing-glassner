void setup() {
   int [] a = { 0, 1, 2, 3, 4, 5, 6, 7, 8 };
   print("a before deleting: ");
   printArray(a);
   int [] b = deleteElement(a, 4);
   print("a after deleting:  "); 
   printArray(a);
   print("b:                 ");
   printArray(b);
}

void printArray(int [] array) {
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
