PImage bg;

// Variables declaration
String gameState;
Button resetButton;
Alien mrAlien;
Spaceship spaceship;
Enemy enemy1;
Score score;
int element = 0;
float bgCounter = 1;
float valueCompare = 1;

void setup() {
  frameRate(40);
  size(800, 800);
  gameState = "START";
  // Inizialization of "Alien" object
  mrAlien = new Alien(100, 115, 400, 690);
  enemy1 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2, height / 2 - height / 6);
  score = new Score();
}

void draw() {
  //clearBackground();
  if (gameState == "START") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "WIN") {
    winGame();
  } else if (gameState == "LOSE") {
    loseGame();
  }
}

void keyPressed() {
  mrAlien.move();
}

void startGame() {
  // Put menu here
  /*
  if(resetButton.isClicked()){
      gameState = "WIN";
    }
    resetButton.update();
    resetButton.render();
    */
  gameState = "PLAY";
}

void playGame() {
  // to save program performance
  if (valueCompare == (int)bgCounter) {
    bg = loadImage("./images/ingame-background/bg (" + (int)bgCounter + ").gif");
  }
  background(bg);
  if (bgCounter < 61)
    bgCounter+= 0.5;
  else
    bgCounter = 1;
  valueCompare = bgCounter;
  // Calling Alien functions to show aliens on screen
  mrAlien.drawBody();
  mrAlien.drawFace();  
  enemy1.drawBody();
  enemy1.move(mrAlien.bodyWidth, mrAlien.bodyHeight);
  score.display();
}
void winGame() {
}
void loseGame() {
}
