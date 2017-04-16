String [] Number = split("Three,Seventeen,Some,A few,Lots of,Most,No", ',');
String [] Animal = split("lion,giraffe,elephantalope,worm", ',');
String [] Person = split("you,your neighbor,Uncle Bob,Crazy Harry", ',');
String [] When = split("Today,This week,Yesterday,March,2003", ',');
String [] Food = split("macaroni,roasted apple,peanut brittle,frog", ',');
String [] Bread = split("rye,wheat,multi-grain,pita,a hot-dog bun", ',');

String F1_1 = "1. ";
String F1_2 = " ";
String F1_3 = "s are out to get ";
String F1_4 = ".";
String F2_1 = "2. ";
String F2_2 = "'s lucky sandwich is ";
String F2_3 = " on ";
String F2_4 = ".";

PFont FortuneFont;

void setup() {
   size(600, 400);
   smooth();
   FortuneFont = loadFont("AmericanTypewriter-48.vlw");
   textAlign(LEFT);
   textFont(FortuneFont, 36);
   frameRate(1/3.0);
}

void draw() {
   background(240);
}
