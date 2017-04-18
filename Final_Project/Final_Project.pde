int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;







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
    strokeWeight(3);
    stroke(255);
    line(100, i, 500, i);
    line(i, 100, i, 500);
    
  }

   

}
void keyPressed() {
  if (key == ' ') {
    setup();
  }
  if( key==left && key==right){

  
  }
}