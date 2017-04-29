class Square{
  int xCoor = 100;
  int yCoor = 500;
  int loop = 0;
  int number =0;
  int row =0;
  int column =0;
  int value;
  boolean appear = false;
  
  Square(){
    xCoor=100;
    yCoor=100;
    row=1;
    column=1;
    
  }
    Square(int x, int y, int r, int c,int v){
    this.number = 2;
    this.value=v;
    this.xCoor= x;
    this.yCoor= y;
   this. row= r;
    this.column = c;
    
  }
void squareDisplay(){
  fill(255);
  rect(xCoor, yCoor, 100,100);
}
 
   void squareDisappear(){
     value=0;
   }
   //to add value on the square
    void value(){
      
    }
  
    }