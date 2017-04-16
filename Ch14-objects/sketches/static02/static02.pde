void setup() {
  Strawberry s1 = new Strawberry(4);
  println("s1 = "+s1.numberOfBerries+"  weight="+s1.weight);
  Strawberry s2 = new Strawberry(5);
  println("s2 = "+s2.numberOfBerries+"  weight="+s2.weight);
  Strawberry s3 = new Strawberry(6);
  println("s3 = "+s3.numberOfBerries+"  weight="+s3.weight);
}

static class Strawberry {
   static int numberOfBerries = 0;
   float weight;
   Strawberry(float aweight) {
      numberOfBerries++;
      weight = aweight;
   }
}
