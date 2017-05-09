class Square {
  int x= 100;
  int y = 500;
  int loop = 0;
  int number =0;
  int row =0;
  int column =0;
  int value;
  boolean appear = false;
  boolean change=false;
  boolean moved = false;
  int[] xValues = new int[4];
  int[] yValues = new int[4];
  int xIndex;
  int yIndex;
  int squarelength=100;
  int coorChange=100;
  color col;

  Square() {
    value = 2;
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
    x = xValues[xIndex];
    y = yValues[yIndex];
    col=color(255, 179, 131);
  }

  Square(int xCoor, int yCoor, int r, int c, int l, int Val) {
    this.number = 2;
    this.x= xCoor;
    this.y= yCoor;
    this.row= r;
    this.column = c;
    this.squarelength=l;
    this.value=Val;

    //random 0 - 3
    xIndex =int(random(0, 3));
    yIndex =int(random(0, 3));
    x = xValues[xIndex];
    y = yValues[yIndex];
  }
  // merge
  void merge() {    
    //  float d= dist(x, y, other.x, other.y);
    //if (d<squarelength + other.squarelength) {
    col= color(255, 179, 100);
    //} else {
    //other.col=color(255);
    value = value*2;
  }
  void squareDisplay() {
    moved = false;
    fill(col);
    rect(x, y, 100, 100);
    fill(255);
    text(value, x+35, y+70);
  }
  //to add value to the square
  void value() {
    fill(255);
    text(value, x+35, y+70);
  }

void reset(){
    xIndex =int(random(0, 3));
    yIndex =int(random(0, 3));
    x = xValues[xIndex];
    y = yValues[yIndex];
    col=color(255, 179, 131);
    value=2;
  
}


  void squaresMoveRight() {
    if (x<400) {
      fill(255, 179, 131);
      rect(x, y, 100, 100); 
      x=x+coorChange;
      moved = true;
    }
  }
  void squaresMoveLeft() {
    if (x>100) {
      fill(255, 179, 131);
      rect(x, y, 100, 100);
      x=x-coorChange;
      moved = true;
    }
  }

  void squaresMoveTop() {
    if (y>100) {
      fill(255, 179, 131);
      rect(x, y, 100, 100);
      y=y-coorChange;
      moved = true;
    }
  }
  void squaresMoveDown() {
    if (y<400) {
      fill(255, 179, 131);
      rect(x, y, 100, 100);
      y=y+coorChange;
      moved = true;
    }
  }
}