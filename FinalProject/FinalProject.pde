int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;
String winText = "You won!";

Square[][] squares= new Square[rows][cols];



void setup(){
  // the background
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
   }
   fill(255,255,255,0);
   stroke(125,227,117);
   strokeWeight(3);
   rect(90,90,420,420);
   // square spawn 

       
     
     
   }


 

void keyPressed() {
  // to restart the game
  if (key == ' ') {
    setup();
  }
   //to-do: to control the squares move up

   //to-do: to control the squares move down
   
   //to-do: to control the squares move left
   
   // to-do: to control the squares move right
}