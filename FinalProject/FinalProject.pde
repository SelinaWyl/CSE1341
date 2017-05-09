/*
CSE1341
Yilin Wen
Final Project
May 09 2017

*/



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
int changeSquare;
int turnsTaken;


// Add background music
Minim m;
AudioPlayer backgroundMusic;

void setup() {

  // the background
  img=loadImage("background.jpg");
  changeSquare = 20;
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
  turnsTaken = 0;
  m= new Minim(this);
  backgroundMusic= m.loadFile("Joy Gruttmann-Schnappi.mp3");
  backgroundMusic.play();
  for (int i=0; i<numSquares; i++) {
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
  for (int i = 0; i < numSquares; i++) {
    squares.get(i).squareDisplay();
  }
  /*for (int i = squares.size()-1; i<14; i++) { 
   squares.get(i).merge(squares.get(i));
   }*/
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
  /*for (int j=squares.size()-1; j<=14; j++) {
    squares.add(new Square());
    squares.get(j).squareDisplay();
  }*/


      if(turnsTaken>=4){
        drawNewSquare();
        turnsTaken=0;
      }
      
      System.out.println(numSquares);
// check if the palyer lose the game

}
// to reset the game
void resetGame() {
}



void keyPressed() {

  // to restart the game
  if (key == ' ') {
    //resetGame();
  }

  // to control the squares move left
  if (key==left) {
    turnsTaken++;
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveLeft();
    }
    for (int i = 0; i < numSquares; i++) {                                                        //for each square
      //squares.get(i). squaresMoveLeft();
      for (int j = 0; j < numSquares; j++) {                                                      //check one square against all squares
        if (i != j) {
          if (squares.get(i).x == squares.get(j).x && squares.get(i).y == squares.get(j).y) {     //if two squares in the same place
            //delete j
            if (squares.get(i).value == squares.get(j).value) {              //if same place with same value
              //turnsTaken = 0;
              squares.get(j).reset();
              for (int z = 0; z < numSquares; z++) {                                                           //check moved square against all squares                                               
                if (squares.get(z).x == squares.get(j).x && squares.get(z).y == squares.get(j).y && z != j) {  //if same place
                  squares.get(j).reset();
                  z = 0;
                }
              }
              squares.get(i).merge();
            } 
            if (squares.get(i).value != squares.get(j).value) {                                                                      
              if (squares.get(i).moved == true) {
                squares.get(i).moved=false;
                squares.get(i).squaresMoveRight();
              } else {
                squares.get(j).moved=false;
                squares.get(j).squaresMoveRight();
              }
              j = 0;
            }
          }
        }
      }
    }
  }


  // to control the squares move right
  if (key== right) {
    turnsTaken++;
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveRight();
    }
    for (int i = 0; i < numSquares; i++) {                                                        //for each square
      for (int j = 0; j < numSquares; j++) {                                                      //check one square against all squares
        if (i != j) {
          if (squares.get(i).x == squares.get(j).x && squares.get(i).y == squares.get(j).y) {     //if two squares in the same place
            //delete j
            if (squares.get(i).value == squares.get(j).value) {                                           //if same place with same value
              squares.get(j).reset();
             //  turnsTaken = 0;
              for (int z = 0; z < numSquares; z++) {                                                           //check moved square against all squares                                               
                if (squares.get(z).x == squares.get(j).x && squares.get(z).y == squares.get(j).y && z != j) {  //if same place
                  squares.get(j).reset();
                  z = 0;
                }
              }
              squares.get(i).merge();
            } 
            if (squares.get(i).value != squares.get(j).value) {                                                                      
              if (squares.get(i).moved == true) {
                squares.get(i).moved=false;
                squares.get(i).squaresMoveLeft();
              } else {
                squares.get(j).moved=false;
                squares.get(j).squaresMoveLeft();
              }
              j = 0;
            }
          }
        }
      }
    }
  }
  // to control the squares move up
  if (key==up) {
    turnsTaken++;
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveTop();
    }
    for (int i = 0; i < numSquares; i++) {                                                        //for each square
      for (int j = 0; j < numSquares; j++) {                                                      //check one square against all squares
        if (i != j) {
          if (squares.get(i).x == squares.get(j).x && squares.get(i).y == squares.get(j).y) {     //if two squares in the same place
            //delete j
            if (squares.get(i).value == squares.get(j).value) {                                           //if same place with same value
              squares.get(j).reset();
               //turnsTaken = 0;
              for (int z = 0; z < numSquares; z++) {                                                           //check moved square against all squares                                               
                if (squares.get(z).x == squares.get(j).x && squares.get(z).y == squares.get(j).y && z != j) {  //if same place
                  squares.get(j).reset();
                  z = 0;
                }
              }
              squares.get(i).merge();
            } 
            if (squares.get(i).value != squares.get(j).value) {                                                                      
              if (squares.get(i).moved == true) {
                squares.get(i).moved=false;
                squares.get(i).squaresMoveDown();
              } else {
                squares.get(j).moved=false;
                squares.get(j).squaresMoveDown();
              }
              j = 0;
            }
          }
        }
      }
    }
  }
  // to control the squares move down
  if (key==down) {
    turnsTaken++;
    for (int i = 0; i < numSquares; i++) {
      squares.get(i). squaresMoveDown();
    }
    for (int i = 0; i < numSquares; i++) {                                                        //for each square
      for (int j = 0; j < numSquares; j++) {                                                      //check one square against all squares
        if (i != j) {
          if (squares.get(i).x == squares.get(j).x && squares.get(i).y == squares.get(j).y) {     //if two squares in the same place
            //delete j
            if (squares.get(i).value == squares.get(j).value) {                                           //if same place with same value
              squares.get(j).reset();
              //turnsTaken = 0;
              for (int z = 0; z < numSquares; z++) {                                                           //check moved square against all squares                                               
                if (squares.get(z).x == squares.get(j).x && squares.get(z).y == squares.get(j).y && z != j) {  //if same place
                  squares.get(j).reset();
                  z = 0;
                }
              }
              squares.get(i).merge();
            } 
            if (squares.get(i).value != squares.get(j).value) {                                                                      
              if (squares.get(i).moved == true) {
                squares.get(i).moved=false;
                squares.get(i).squaresMoveTop();
              } else {
                squares.get(j).moved=false;
                squares.get(j).squaresMoveTop();
              }
              j = 0;
            }
          }
        }
      }
    }
  }
}

void drawNewSquare() {
  numSquares++;
  squares.add(new Square());
  for (int i = 0; i < numSquares -1; i++) {
    while (squares.get(numSquares-1).x == squares.get(i).x && squares.get(numSquares-1).y == squares.get(i).y)
      squares.get(numSquares-1).reset();
  }
}