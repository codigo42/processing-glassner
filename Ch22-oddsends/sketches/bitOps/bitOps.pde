void setup() {
  int a = 218;
  int b = 185;
  int a_or_b = a|b;
  int a_and_b = a&b;
  int a_shift_r = a>>1;
  int a_shift_l = a<<1;
  
  println("a="+a+"          in binary="+binary(a));
  println("b="+b+"          in binary="+binary(b));
  println("a_or_b="+a_or_b+"     in binary="+binary(a_or_b));
  println("a_and_b="+a_and_b+"    in binary="+binary(a_and_b));
  println("a_shift_r="+a_shift_r+"  in binary="+binary(a_shift_r));
  println("a_shift_l="+a_shift_l+"  in binary="+binary(a_shift_l));
}
