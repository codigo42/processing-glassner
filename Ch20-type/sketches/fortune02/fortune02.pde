// Fortune cookie program
// version 1.0 - AG 24 April 2009
// 1. <Number> <Animal>s are out to get <Person>.
// 2. <When>'s lucky sandwich is <Food> on <Bread>.

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

void setup() {
   size(600, 400);
   smooth();
   PFont fortuneFont = loadFont("AmericanTypewriter-48.vlw");
   textAlign(LEFT);
   textFont(fortuneFont, 36);
   frameRate(1/3.0);
}

void draw() {
   background(240);

   fill(84, 65, 19);  // brown
   String message1 = F1_1 + Number[int(random(0, Number.length))] +
                     F1_2 + Animal[int(random(0, Animal.length))] +
                     F1_3 + Person[int(random(0, Person.length))] + F1_4;
   text(message1, 50, 50, 500, 175);
  
   fill(39, 68, 92);  // dark blue
   String message2 = F2_1 + When[int(random(0, When.length))] +
                     F2_2 + Food[int(random(0, Food.length))] +
                     F2_3 + Bread[int(random(0, Bread.length))] + F2_4;
   text(message2, 50, 200, 500, 175);
}
