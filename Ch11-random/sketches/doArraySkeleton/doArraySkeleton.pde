int [] A = { 1, 2, 3, 4, 5, 6}; 
int [] B = { 10, 20, 30, 40, 50}; 
int [] C = { };

void setup() { 
  println("Before:"); 
  print("A: "); 
  printArray(A); 
  print("B: "); 
  printArray(B); 
  print("C: "); 
  printArray(C); 
  doArrayThing(); 
  println("After:"); 
  print("A: "); 
  printArray(A); 
  print("B: "); 
  printArray(B); 
  print("C: "); 
  printArray(C);;
}

void printArray(int[] v) { 
  for (int i=0; i<v.length; i++) {
    print(v[i]+" "); print("\n");
  }
}

void doArrayThing() { }
