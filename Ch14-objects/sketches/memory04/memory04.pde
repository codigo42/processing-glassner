class Apple {    // a tiny Apple class
   float weight;
   float size;
   Apple(float aweight, float asize) {
      weight = aweight;  
      size = asize;      
   }
   
   Apple() {     // a blank constructor for a default apple
      weight = 1;
      size = 1;    
   }

   Apple makeCopy() {
      Apple newApple = new Apple();  // make a default apple
      newApple.weight = weight;
      newApple.size = size;
      return(newApple);
   }
}

void setup() {
   Apple a = new Apple(4, 5);
   Apple b = a.makeCopy();
   println("a.weight = "+a.weight+"  a.size = "+a.size);
   println("b.weight = "+b.weight+"  b.size = "+b.size);
   b.weight = 5000;
   println("changed the weight of b");
   println("a.weight = "+a.weight+"  a.size = "+a.size);
   println("b.weight = "+b.weight+"  b.size = "+b.size);
}
