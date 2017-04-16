void setup() {
   PVector A = new PVector(10, 20);
   PVector Acopy = A.get();
   PVector B = new PVector(40, 80);
   PVector BminusA = B.get();
   BminusA.sub(A);
   BminusA.normalize();
   BminusA.mult(3);
   A.add(BminusA);
   println("new A: ("+A.x+", "+A.y+")");
   println("distance from A to original A: "+A.dist(Acopy));
}
   
