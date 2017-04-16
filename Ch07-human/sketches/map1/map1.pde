void setup() {
   float r1 = 10.0;
   float r2 = 20.0;
   float s1 = 30.0;
   float s2 = 40.0;
   float a = 12.0;
   showmap(a, r1, r2, s1, s2);
   showmap(a, r2, r1, s1, s2);
   showmap(a, r1, r2, s2, s1);
   showmap(a, r2, r1, s2, s1);
}

void showmap(float a, float rlo, float rhi, float slo, float shi)
{
   println("map "+a+" from ("+rlo+", "+rhi+") to ("+slo+", "+shi+") = "+map(a,rlo,rhi,slo,shi));
}
