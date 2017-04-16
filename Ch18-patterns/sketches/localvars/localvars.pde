int Avar = 5;

void setup() {
  test1();
  test2();
  test1();
}

void test1() {
  println("test 1: Avar="+Avar);
}

void test2() {
  int Avar = 8;
  println("test 2: Avar="+Avar);
}
