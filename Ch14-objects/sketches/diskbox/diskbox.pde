Disk [] Ghosts;

void setup() {
   size(600, 400);
   background(132, 144, 163);
   buildGhosts();
}

void draw() {
   for (int i=0; i<Ghosts.length; i++) {
      Ghosts[i].render();
   }
}

void buildGhosts() {
   Ghosts = new Disk[10];
   int border = 50;
   for (int i=0; i<Ghosts.length; i++) {
      float xPos = random(border, width-border);
      float yPos = random(border, height-border);
      float xDir = 10;
      float yDir = 10;
      float radius = random(10, 30);
      color clr = color(random(20, 255),
                        random(20, 255),
                        random(20, 255), 128);
      Ghosts[i] = new Disk(xPos, yPos, xDir, yDir, radius, clr);
   }
}

class Disk {
   float xPos;  
   float yPos;  
   float strokeSize;   
   float angle;
   float sideLength; 
   color clr;    

   Disk (float axPos, float ayPos, float astrokeSize,  float aangle,
   float asideLength, color aclr) {
      xPos       = axPos;
      yPos       = ayPos;
      strokeSize = astrokeSize;
      angle      = aangle;
      sideLength = asideLength * 2;
      clr        = aclr;
   }
   
   void render() {
      fill(clr);
      strokeWeight(strokeSize/2.0);
      pushMatrix();
        translate(xPos, yPos);
        rotate(radians(angle));
        rect(-sideLength/2.0, -sideLength/2.0, sideLength, sideLength);
      popMatrix();
   }
}
