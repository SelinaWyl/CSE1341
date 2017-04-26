class Square{
  int xCoor = 100;
  int yCoor = 500;
  int loop = 0;
  int number =0;
  int row =0;
  int column =0;
  int value;
  boolean appear = false;
  
  
   Square(int x, int y, int r, int c,int v){
    number = 2;
    value=v;
    xCoor= x;
    yCoor= y;
    row= r;
    column = c;
    
  }
  
  
  
// Square spawn
  void squareDisplay() {
    fill(240,98,41);
    rect(xCoor,yCoor, 100, 100);
    fill(255);
    text(value,xCoor+45,yCoor+55);
    
    
      
   }
   void squareDisappear(){
     value=0;
   }
   //to add value on the square
    void value(){
      
    }
  
    }