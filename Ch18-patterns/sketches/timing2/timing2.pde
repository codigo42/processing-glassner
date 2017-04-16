void setup() {
  int numsteps = 100000000;
  int t1, t2;
  float x, v, fraction;
  int i, index0, index1;

  float [] ExpTable;
  ExpTable = new float[200];
  for (i=0; i<ExpTable.length; i++) {
    x = i/(ExpTable.length-1.0);
    v = exp(-4*x*x);
    ExpTable[i] = map(v, 1, 0.01831564, 1, 0);
  }
  
  t1 = millis();
  for (i=0; i<numsteps; i++) {
    x = i/(numsteps-1.0);
    v = exp(-4*x*x);
    v = map(v, 1, 0.01831564, 1, 0);
  }
  t2 = millis();
  int delta1 = t2-t1;
  
    t1 = millis();
  for (i=0; i<numsteps; i++) {
    x = i/(numsteps-1.0);
    float xIndex = x * (ExpTable.length-1);
    index0 = floor(xIndex);
    v = ExpTable[index0];    
  }
  t2 = millis();
  int delta2 = t2-t1;
  
  t1 = millis();
  for (i=0; i<numsteps; i++) {
    x = i/(numsteps-1.0);
    float xIndex = x * (ExpTable.length-1);
    index0 = floor(xIndex);
    index1 = ceil(xIndex);
    fraction = xIndex - index0;
    v = lerp(ExpTable[index0], ExpTable[index1], fraction);    
  }
  t2 = millis();
  int delta3 = t2-t1;
  
  println("delta1="+delta1+"  delta2="+delta2+"  delta3="+delta3);
}
  
  
