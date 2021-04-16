PImage bg;

// Variables declaration
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
  // Inizialization of objects "Alien"
  mrAlien = new Alien(100, 115, 400, 690);
  enemy1 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2, height / 2 - height / 6);
  score = new Score();
}

void draw() {
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

void keyPressed() {
  mrAlien.move();
}
