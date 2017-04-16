TestClass MyTester;
void setup () {
   MyTester = new TestClass();
   MyTester.print1();
   MyTester.print2();
}

class TestClass {
  TestClass() { }
  void print1() { println("1"); }
  void print2() { println("2"); }
}
