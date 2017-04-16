
class Peach {
  float weight;
  Peach (float aweight) {
    weight = aweight;
  }
}
  
void setup() {
  Peach [] peachList = { new Peach(3), new Peach(4), new Peach(5) };
  peachList = append(peachList, new Peach(6));
}
