float Lerpval = 0.5;
float BarrierCenter = 300;

void setup() {
   size(600, 400);
}

void draw() {
   background(192);
   noStroke();
   drawSources();
   drawBarrier();
   drawFlows();
   drawBowl();
   drawHandle();
}

void drawSources() {
   fill(255, 0, 0);
   rect(200, 125, 100, 100);
   fill(255, 255, 0);
   rect(300, 125, 100, 100);
}

void drawBowl() {
   float myRed = 255;
   float myGrn = lerp(0, 255, Lerpval);
   float myBlu = 0;
   fill(myRed, myGrn, myBlu);
   stroke(0, 0, 0);
   beginShape();
      vertex(100, 300);
      bezierVertex(250, 350, 350, 350, 500, 300);
      vertex(400, 380);
      vertex(200, 380);
      vertex(100, 300);
   endShape(CLOSE);
   noStroke();
}

void drawBarrier() {
   fill(128, 128, 128, 128);
   noStroke();
   rect(BarrierCenter-200, 100, 400,  25);  // top
   rect(BarrierCenter-200, 125, 150, 100);  // left
   rect(BarrierCenter+50,  125, 150, 100);  // right
}

void drawHandle() {
   // the handle
   fill(100, 100, 100);
   rect(BarrierCenter-225, 90, 450, 10); // top bar
   rect(BarrierCenter-5, 50, 10, 50);    // vertical bar
   rect(250, 47, 100, 6);                // the slot
   ellipse(250, 50, 15, 15);             // left notch
   ellipse(350, 50, 15, 15);             // right notch

   // the knob
   fill(32, 32, 32);
   ellipse(BarrierCenter, 50, 25, 25);   // outer handle
   fill(224, 224, 224);
   ellipse(BarrierCenter, 50, 8, 8);    // inner handle
}

void drawFlows() {
   fill(255, 0, 0);
   rect(BarrierCenter-50, 200, 350-BarrierCenter, 150);
   fill(255, 255, 0);
   rect(300, 200, (BarrierCenter+50)-300, 150);
}

void mousePressed() { handleMouse(); }
void mouseDragged() { handleMouse(); }

void handleMouse() {
   BarrierCenter = mouseX;
   if (BarrierCenter < 250) BarrierCenter = 250;
   if (BarrierCenter > 350) BarrierCenter = 350;
   Lerpval = (BarrierCenter-250.0)/100.0;
}
   
