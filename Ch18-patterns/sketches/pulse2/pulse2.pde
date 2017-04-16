float Angle = 0;

void setup() {
   size(600, 400);
   fill(196, 84, 94);
}

void draw() {
   background(135, 125, 112);
   for (int i=0; i<6; i++) {
      float sine_angle = Angle * (1+i/5.0);
      float radius = map(sin(sine_angle), -1, 1, 20, 40);
      ellipse(50+(100*i), 200, 2*radius, 2*radius);
   }
   Angle += .1;
}
