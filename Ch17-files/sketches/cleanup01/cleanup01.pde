void setup() {
  size(1600,630);
  background(255);
  stroke(0);
  strokeWeight(2);
  String [] lines = loadStrings("../Body-ManPoints.txt");
  int ox, oy, x, y;
  ox = oy = x = y = 0;
  for (int i=0; i<lines.length; i++) {
    String[] words = split(lines[i], '\t');
    if (i>0) {
      x = int(words[0]);
      y = int(words[1]);
      line(ox, oy, x, y);
    }
    ox = x;
    oy = y;
  }
}
