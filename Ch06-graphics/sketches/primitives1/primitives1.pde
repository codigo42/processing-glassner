void setup() { 
   size(600, 400);
   background(163, 143, 109);
}  

void draw() {
   rect(20, 40, 100, 50);
   rect(150, 40, 80, 80);
   ellipse(70, 200, 100, 50);
   ellipse(190, 200, 80, 80);
   arc(300, 180, 100, 100, radians(0), radians(90));
   triangle(50, 300, 110, 320, 90, 360);
   quad(190, 300, 220, 320, 210, 360, 150, 340);
   line(300, 40, 340, 100);
   point(300, 320);
}
