class Square {
  int xCoor = 100;
  int yCoor = 500;
  int loop = 0;
  int number =0;
  int row =0;
  int column =0;
  int value;
  boolean appear = false;
  int[] xValues = new int[4];
  int[] yValues = new int[4];
  int xIndex;
  int yIndex;
  int squarelength=100;
  int squareChange=100;

  Square() {
    xCoor=100;
    yCoor=100;
    row=1;
    column=1;
    xIndex =int(random(0, 3));
    yIndex =int(random(0, 3));
    for (int i = 0; i < 4; i ++) {
      xValues[i] = 100 + (i* (100));
      yValues[i] = 100 + (i* (100));
    }
    xCoor = xValues[xIndex];
    yCoor = yValues[yIndex];
  }

  Square(int x, int y, int r, int c, int l) {
    this.number = 2;
    this.xCoor= x;
    this.yCoor= y;
    this. row= r;
    this.column = c;
    this.squarelength=l;
    //random 0 - 3
    xIndex =int(random(0, 3));
    yIndex =int(random(0, 3));
    xCoor = xValues[xIndex];
    yCoor = yValues[yIndex];
  }
  boolean merge(Square other) {
    float d= dist(xCoor, yCoor, other.xCoor, other.yCoor);
    if (d<squarelength-other.squarelength) {
      return true;
    } else {

      return false;
    }
  }
  void squareDisplay() {
    fill(255, 179, 131);
    rect(xCoor, yCoor, 100, 100);
    fill(255);
    text("2", xCoor+35, yCoor+70);
  }
  //to add value to the square
  void value() {
    fill(255);
    text("2", xCoor+35, yCoor+70);
  }
  



  void squaresMoveRight() {
    if (xCoor<400) {
      fill(255, 179, 131);
      rect(xCoor, yCoor, 100, 100); 
      xCoor=xCoor+squareChange;
    }
  }
  void squaresMoveLeft() {
    if (xCoor>100) {
      fill(255, 179, 131);
      rect(xCoor, yCoor, 100, 100);
      xCoor=xCoor-squareChange;
    }
  }

  void squaresMoveTop() {
    if (yCoor>100) {
      fill(255, 179, 131);
      rect(xCoor, yCoor, 100, 100);
      yCoor=yCoor-squareChange;
    }
  }
  void squaresMoveDown() {
    if (yCoor<400) {
      fill(255, 179, 131);
      rect(xCoor, yCoor, 100, 100);
      yCoor=yCoor+squareChange;
    }
  }
}