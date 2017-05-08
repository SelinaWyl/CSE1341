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
  // draw the background
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
  for (int j=squares.size()-1; j<=14; j++) {
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
// check if the palyer lose the game
boolean gameOver() {

  for (int r=0; r<4; r++) {
    for (int c=0; c<4; c++) {
      if (square[r][c].value==0)
        return false;
      if (c>0)
        if (square[r][c].value==square[r-1][c].value)
          return false; 
      if (r>0)
        if (square[r][c].value==square[r][c-1].value)
          return false; 
      if (r<3)
        if (square[r][c].value==square[r][c+1].value)
          return false;
      if (c<3)
        if (square[r][c].value==square[r+1][c].value)
          return false;
    }
  }
  fill(255);
  stroke(255);
  text(loseText, 300, 300);
  println("Game over");
  return true;
}
// to reset the game
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
 
  // to control the squares move left
  if (key==left) {
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveLeft();
      boolean merge = true;
      int changes=0;
      while (merge) {
        merge=false;
        for (int r=0; r<4; r++) {
          for (int c=1; c<4; c++) {    
            if (square[r][c].value!=0 && square[r][c].value==square[r-1][c].value && !square[r][c].merge && !square[r-1][c].merge) {               
              square[r-1][c].value*=2;     
                square[r][c].delete();
              square[r-1][c].merge=true;
              merge=true;
              changes++;
            } else if (square[r][c].value!=0 && square[r-1][c].value==0) {       
              square[r-1][c].value=square[r][c].value;
              square[r][c].delete();
              println(r + "," + c + "moved left");
              merge=true;
              changes++;
            }
          }
        }
      }
       squares.get(i).squareDisplay();
      return changes;
    }
  }

 // to control the squares move right
  if (key== right) {
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveRight();
    }
  }
// to control the squares move up
if (key==up) {
  for (int i=0; i<numSquares; i++) {
    squares.get(i). squaresMoveTop();
  }
}
// to control the squares move down
if (key==down) {
  for (int i=0; i<numSquares; i++) {
    squares.get(i). squaresMoveDown();
  }
}
}