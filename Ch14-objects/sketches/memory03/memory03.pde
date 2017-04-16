class Apple {    // a tiny Apple class
   float weight;
   Apple(float aweight) {
      weight = aweight;
   }
}

void setup() {
   Apple a = new Apple(3);
   Apple b = new Apple(100);
   b = a;
   println("just assigned b=a.  a.weight = "+a.weight+", b.weight = "+b.weight);
   b.weight = 15; 
   println("just assigned to b. a.weight = "+a.weight+", b.weight = "+b.weight);
}
