int Score = 0;

float ZoneCenterX, ZoneSpeed, OuterZoneWidth, InnerZoneWidth;
int ZoneDirection;

void setup() {
  size(600, 400);
  
   ZoneCenterX = 0;
   ZoneSpeed = 1.5;    // pixels per frame 
   InnerZoneWidth = width/50.0;  
   OuterZoneWidth = width/15.0;
   ZoneDirection = 1;   
}

void draw() {
   ZoneCenterX += ZoneDirection * ZoneSpeed;
   if ((ZoneCenterX < 0) || (ZoneCenterX >= width)) {
     ZoneSpeed *= -1;
   }
   background(115, 40, 22);
   noStroke();
   fill(186, 186, 115);  
   rect(ZoneCenterX-OuterZoneWidth/2, 0, OuterZoneWidth, height);
   fill(46, 118, 56);
   rect(ZoneCenterX-InnerZoneWidth/2, 0, InnerZoneWidth, height);
}

void mousePressed() {
  float distance = ZoneCenterX - mouseX;
  if (distance < 0) distance = -distance;   // better: distance = abs(distance);
  if (distance < InnerZoneWidth/2.0) {
     Score += 20;
     println("BULLS EYE! ");
  } else if (distance < OuterZoneWidth/2.0) {
     Score += 5;
  } else {
     println("oops ");
     Score -= 5;
  }
  println(Score);
}
