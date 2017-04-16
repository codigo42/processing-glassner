void setup() {
   for (int i=0; i<11; i++) {
      float x = i/10.0;
      float v = exp(-4*x*x);
      println("x="+x+"  v="+v);
   }
}
