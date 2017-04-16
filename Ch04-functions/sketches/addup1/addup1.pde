void setup() {
   float v1 = 3.0;
   float v2 = 8.7;
   float v3 = -3.0;
   float sum = add3Numbers(v1, v2, v3);
   println("The final sum is "+sum);
}

float add3Numbers(float number1, float number2, float number3)
{
   return(number1+number2+number3);
}
