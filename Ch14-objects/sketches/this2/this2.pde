TestClass MyTester;
void setup () {
   MyTester = new TestClass();
   MyTester.print1().print2();
}

class TestClass {
  TestClass() { }
  TestClass print1() { println("1"); return(this); }
  TestClass print2() { println("2"); return(this); }
}
