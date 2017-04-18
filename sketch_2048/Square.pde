
class Square{
  int start = 100;
  int stop = 500;
  int loop = 0;
  boolean appear = false;

  void square() {
    rect(start, start, 400, 400);
    for (int i = start; i<=stop; i=i+100) {
      smooth();
      strokeWeight(3);
      line(start, i, stop, i);
      line(i, start, i, stop);
    }

  }
}