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

  Square(int x, int y, int r, int c) {
    this.number = 2;
    this.xCoor= x;
    this.yCoor= y;
    this. row= r;
    this.column = c;
    //random 0 - 3
    xIndex =int(random(0, 3));
    yIndex =int(random(0, 3));
    xCoor = xValues[xIndex];
    yCoor = yValues[yIndex];
  }

  void squareDisplay() {
    fill(255, 179, 131);
    rect(xCoor, yCoor, 100, 100);
  }
  //to add value to the square
  void value() {
    fill(255);
    text("2", xCoor+35, yCoor+70);
  }

void squaresCollide(){
  while(
  
}



  void squaresMoveRight() {

    fill(255, 179, 131);
    if (xCoor>100) {
      for(xCoor=0;xCoor<400;xCoor=xCoor+100){
      rect(xCoor, yCoor, 100, 100);
     
      }
    }
    
  }
  void squaresMoveLeft() {
    if (xCoor<400) {
      for(xCoor=0;xCoor<100;xCoor=xCoor-100){
      fill(255,179,131);
      rect(xCoor, yCoor, 100, 100);
      
      }
    }
  }
  void squaresMoveTop() {
    if(yCoor<400){
      for(yCoor=0;yCoor>100;yCoor=yCoor-100){
      fill(255,179,131);
      rect(xCoor,yCoor,100,100);
      
    }
    }
  }
  void squaresMoveDown() {
    if (yCoor<400 ) {
      for(yCoor=0;yCoor<400;yCoor=yCoor+100){
      fill(255, 179, 131);
      rect(xCoor, yCoor, 100, 100);
  
      }
    }
  }
}