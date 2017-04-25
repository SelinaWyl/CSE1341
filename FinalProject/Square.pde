class Square{
  int startCoor = 100;
  int stopCoor = 500;
  int loop = 0;
  int number =0;
  int row =0;
  int column =0;
  int value;
  boolean appear = false;
  
  
   Square(int x, int y, int r, int c){
    number = 2;
    startCoor= x;
    stopCoor= y;
    row= r;
    column = c;
    
  }
  
  
  
// Square spawn
  void squareDisplay() {
    fill(255);
    rect(startCoor,stopCoor, 100, 100);
    fill(0);
   
      
   }
   void squareDisappear(){
     value=0;
   }
    
  
    }