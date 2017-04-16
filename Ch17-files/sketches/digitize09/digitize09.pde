PImage Picture;
PrintWriter OutputFile;
float Bx, By;

void setup() {
   size(1600, 630);
   Picture = loadImage("../oddman.png");
   image(Picture, 0, 0);
   OutputFile = createWriter("DrawingPoints.txt");
   fill(255, 0, 0);
   noStroke();
}

void draw() {
}

void mouseClicked() {
   findBorder(mouseX, mouseY);
   OutputFile.println(Bx + "\t" + By);
   ellipse(Bx, By, 3, 3);
}

void keyPressed() {
  if (key == 'z') {
    OutputFile.println("ERROR!");
    return;
  }
  OutputFile.flush();
  OutputFile.close();
  exit();
}

void findBorder(int mx, int my) {
   Bx = mx;
   By = my;
   boolean foundBorder = false;
   float nearestDistance = 0;
   for (int dy= -5; dy<6; dy++) {
      for (int dx= -5; dx<6; dx++) {
         if (onBorder(mx+dx, my+dy)) {
            float distance = mag(dx, dy);
            if ((!foundBorder) || (distance < nearestDistance)) {
                foundBorder = true;
                nearestDistance = distance;
                Bx = mx+dx;
                By = my+dy;
            }
         }
      }
   }
}

boolean onBorder(int tx, int ty) {
   color tcolor = Picture.get(tx, ty);
   if ((tcolor != Picture.get(tx-1, ty-1)) || // upper left
       (tcolor != Picture.get(tx,   ty-1)) || // above
       (tcolor != Picture.get(tx+1, ty-1)) || // upper right
       (tcolor != Picture.get(tx-1, ty  )) || // left
       (tcolor != Picture.get(tx+1, ty  )) || // right
       (tcolor != Picture.get(tx-1, ty+1)) || // lower left
       (tcolor != Picture.get(tx,   ty+1)) || // below
       (tcolor != Picture.get(tx+1, ty+1)))   // lower right
      return(true);
   return(false);
}
