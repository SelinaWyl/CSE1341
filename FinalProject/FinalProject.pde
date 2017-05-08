import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage img;
PImage icon;
int xCoor=100;
int yCoor=100;
int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;
String winText = "You won!";
String loseText="You Lose !";
ArrayList<Square> squares= new ArrayList<Square>();
int numSquares;
int squareChange=100;
boolean merge= true;
int val;
Square square[][];

// Add background music
Minim m;
AudioPlayer backgroundMusic;

void setup() {

  // the background
  img=loadImage("background.jpg");
  size(600, 600);
  background(255);
  image(img, 0, 0);
  textSize(35);
  fill(255);
  text("Press 'space' to reset game", 75, 580);
  fill(255);
  textSize(50);
  text("2048", 240, 70);
  fill(245, 232, 91);
  rect(100, 100, 400, 400);
  fill(255, 255, 255, 0);
  stroke(125, 227, 117);
  strokeWeight(3);
  rect(90, 90, 420, 420);
  numSquares = 2;
  m= new Minim(this);
  backgroundMusic= m.loadFile("Joy Gruttmann-Schnappi.mp3");
  backgroundMusic.play();
  for (int i=0; i<14; i++) {
    squares.add(new Square());
  }
}

void draw() {
  background(255);
  image(img, 0, 0);
  textSize(35);
  fill(255);
  text("Press 'space' to reset game", 75, 580);
  fill(255);
  textSize(50);
  text("2048", 240, 70);
  fill(245, 232, 91);
  rect(100, 100, 400, 400);
  fill(255, 255, 255, 0);
  stroke(125, 227, 117);
  strokeWeight(3);
  rect(90, 90, 420, 420);
  //merge
  for (int i = squares.size()-1; i<14; i++) { 
    squares.get(i).merge(squares.get(i));
  }
  for (int i = 100; i<=500; i=i+100) {
    smooth();
    strokeWeight(5);
    stroke(255);
    line(100, i, 500, i);
    line(i, 100, i, 500);
  }

  // squares spawn
 for (int i = 0; i < numSquares; i++) {

    squares.get(i).squareDisplay();
  }
//check if suquares merge, spawn a new one
for(int j=squares.size()-1;j<=14;j++){
   squares.add(new Square());
  squares.get(j).squareDisplay();
}
 /*for(int n=squares.size()-1;n>=0;n--){
   
   if(squares.get(n).merge(Square other)){
     squares.remove(n);
   }
   
  }
  */
}
boolean gameOver(){
  
  for(int i=0;i<4;i++){
  for(int j=0;j<4;j++){
    if(square[j][i].val==0)
      return false;
    if(j>0)
      if(square[j][i].val==square[j-1][i].val)
        return false; 
    if(i>0)
      if(square[j][i].val==square[j][i-1].val)
        return false; 
    if(i<3)
      if(square[j][i].val==square[j][i+1].val)
        return false;
    if(j<3)
      if(square[j][i].val==square[j+1][i].val)
        return false;         
  }
  }
  fill(255);
  stroke(255);
  text(loseText,300,300);
  println("Game over");
  return true;
  
}

void resetGame() {
  img=loadImage("background.jpg");
  size(600, 600);
  background(255);
  image(img, 0, 0);
  textSize(35);
  fill(255);
  text("Press 'space' to reset game", 75, 580);
  fill(255);
  textSize(50);
  text("2048", 240, 70);
  fill(245, 232, 91);
  rect(100, 100, 400, 400);
  fill(255, 255, 255, 0);
  stroke(125, 227, 117);
  strokeWeight(3);
  rect(90, 90, 420, 420);
  m= new Minim(this);
  backgroundMusic= m.loadFile("Joy Gruttmann-Schnappi.mp3");
  backgroundMusic.play();
}





void keyPressed() {

  // to restart the game
  if (key == ' ') {
    resetGame();
  }
  //to-do: to control the squares move up
  if (key== right) {
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveRight();
    }
  }
  if (key==left) {
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveLeft();
      
    }
  }
  if (key==up) {
    for (int i=0; i<numSquares; i++) {
      squares.get(i). squaresMoveTop();
    }
  }
  if (key==down) {
    for (int i=0; i<numSquares; i++) {
      squares.get(i). squaresMoveDown();
    }
  }
}