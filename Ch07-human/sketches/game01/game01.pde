int Score = 0;

float ZoneCenterX, ZoneSpeed, OuterZoneWidth, InnerZoneWidth;

void setup() {
  size(600, 400);
  
   ZoneCenterX = 0;
   ZoneSpeed = 1.5;    // pixels per frame 
   InnerZoneWidth = width/50.0;  
   OuterZoneWidth = width/15.0;   
}

void draw() {
   ZoneCenterX += ZoneSpeed;
   background(115, 40, 22);
   noStroke();
   fill(186, 186, 115);  
   rect(ZoneCenterX-OuterZoneWidth/2, 0, OuterZoneWidth, height);
   fill(46, 118, 56);
   rect(ZoneCenterX-InnerZoneWidth/2, 0, InnerZoneWidth, height);
}

