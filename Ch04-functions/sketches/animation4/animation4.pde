int Redval = 12;
int Grnval = 64;
int Bluval = 0;

void setup() {
   size(600, 400);
   background(Redval, Grnval, Bluval);
}

void draw() {
   Redval = Redval + 1;
   background(Redval, Grnval, Bluval);
}
