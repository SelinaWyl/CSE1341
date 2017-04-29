import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage img;
PImage icon;
int rows=4;
int cols=4;
char up='w';
char down='s';
char right='d';
char left='a';
float squareSize=100;
String winText = "You won!";
String loseText="You Lose !";


//Square[][] squares= new Square[rows][cols];
ArrayList<Square> squares = new ArrayList<Square>();
  


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
  m= new Minim(this);
  backgroundMusic= m.loadFile("Joy Gruttmann-Schnappi.mp3");
  backgroundMusic.play();
}
void draw() {
  for (int i = 100; i<=500; i=i+100) {
    smooth();
    strokeWeight(5);
    stroke(255);
    line(100, i, 500, i);
    line(i, 100, i, 500);
  }

   squares.add(new Square());
      
  
   // squares spawn
   for(int i = squares.size()-1;i>=0;i--){
     squares.get(i).squareDisplay();
   }
}
     
// squares.add(new Square());






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