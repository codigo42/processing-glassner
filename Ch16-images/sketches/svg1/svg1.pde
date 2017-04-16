void setup() {
  size(350, 500);
  PShape s = loadShape("lamp.svg");
  smooth();
  shape(s, 50, 50);
}
