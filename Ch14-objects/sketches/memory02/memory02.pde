class Apple {    // a minimal Apple class
   Apple() { }
}

void setup() {
   makeAnApple();
   println("back from setup");
}

void makeAnApple() {
   Apple myApple;            // line A
   myApple = new Apple();    // line B
   println("I made an apple");
}

