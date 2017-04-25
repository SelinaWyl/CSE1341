int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;
ArrayList<Square> squares=new ArrayList<Square>();
long 





void setup(){
  size(600,600);
   background(255);
  textSize(30);
  fill(125,227,117);
  text("Press 'space' to reset game", 95, 580);
  textSize(50);
  text("2048", 240, 50);
  
  
}
void draw(){
  fill(245,232,91);
  rect(100,100,400,400);
   for (int i = 100; i<=500; i=i+100) {
    smooth();
    strokeWeight(5);
    stroke(255);
    line(100, i, 500, i);
    line(i, 100, i, 500);
    // Square Spawn
    for(int j=0; j<squares.size();j++){
      squares.get(j).squareDisplay();
    
    }
  }
  //to-do: to control the squares move up

   //to-do: to control the squares move down
   
   //to-do: to control the squares move left
   
   // to-do: to control the squares move right

}


void keyPressed() {
  // to restart the game
  if (key == ' ') {
    setup();
  }
  //control the Squares
  if( key==left && key==right){

  
  }
}