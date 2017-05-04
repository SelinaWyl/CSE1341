import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage img;
PImage icon;
int xCoor=100;
int yCoor=500;
int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;
String winText = "You won!";
String loseText="You Lose !";
Square squares[];
int numSquares;







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
  squares = new Square[8];
  for (int i = 0; i<8; i++) {
    squares[i] = new Square();
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

  for (int i = 100; i<=500; i=i+100) {
    smooth();
    strokeWeight(5);
    stroke(255);
    line(100, i, 500, i);
    line(i, 100, i, 500);
  }

  // squares spawn

  //int x = xCoor;
  //int y = yCoor;

  for (int i = 0; i < numSquares; i++) {
    squares[i].squareDisplay();
    squares[i].value();
  }
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
      squares[i]. squaresMoveRight();
    }
  }
    if (key==left) {
      for (int i = 0; i < numSquares; i++) {
        squares[i]. squaresMoveLeft();
      }
    }
      if (key==up) {
        for (int i=0; i<numSquares; i++) {
          squares[i].squaresMoveTop();
        }
      }
        if (key==down) {
          for (int i=0; i<numSquares; i++) {
            squares[i].squaresMoveDown();
          }
        }
        
      }
    
  