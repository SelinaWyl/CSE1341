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
  //int xCoor=int(random(100,400));
  //int yCoor=int(random(100,400));
  
  fill(255,179,131);
  rect(xCoor, yCoor, 100,100);
 
}
 
   void squareDisappear(){
     value=0;
   }
   //to add value on the square
    void value(){
      
    }
  void squaresMoveRight(){
    fill(255,179,131);
    if(xCoor<400){
    rect(xCoor,yCoor,100,100);
    xCoor=xCoor+100;
    }
  }
    void squaresMoveLeft(){
    if (xCoor<400){
      fill(255);
      rect(xCoor,yCoor,100,100);
      xCoor=xCoor-100;
  }
    }
}