int rows=4;
int cols=4;
float squareSize=100;
Square[][] Squares;





void setup(){
  size(600,600);
   background(255);
  textSize(30);
  fill(140,222,114);
  text("Press 'space' to reset game", 95, 580);
  textSize(50);
  text("2048", 50, 50);
  Squares = new Square[4][4];
  
}
void draw(){
  fill(152,178,222);
  rect(100,100,400,400);
   for (int i = 100; i<=500; i+=100) {
    smooth();
    strokeWeight(3);
    line(100, i, 500, i);
    line(i, 100, i, 500);
  }
  
  
}
void keyPressed() {
  if (key == ' ') {
    setup();
  }
}