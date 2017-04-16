void setup() {
  int numsteps = 10000;
  int i, x, y;
  float dx, dy, dd, d;
  int t1, t2;
  float g=0;
  
  int radius = 100;
  int radius2 = radius * radius;
  int lox = 100;
  int loy = 100;
  int hix = lox + (2*radius);
  int hiy = loy + (2*radius);
  int cx = lox + radius;
  int cy = loy + radius;
  
  t1 = millis();
  for (i=0; i<numsteps; i++) {
    for (y=loy; y<hiy; y++) {
      for (x=lox; x<hix; x++) {
        dd = dist(x, y, cx, cy);
        if (dd > radius) continue;
        g++;
      }
    }
  }
  t2 = millis();
  int delta1 = t2-t1;
  
  t1 = millis();
  for (i=0; i<numsteps; i++) {
    for (y=loy; y<hiy; y++) {
      for (x=lox; x<hix; x++) {
        dx = x-cx;
        dy = y-cy;
        dd = sq(dx)+sq(dy);
        if (dd > radius2) continue;
        d = sqrt(dd);
        g++;
      }
    }
  }
  t2 = millis();
  int delta2 = t2-t1;
  
  println("delta1="+delta1+"  delta2="+delta2);
}
  
  
