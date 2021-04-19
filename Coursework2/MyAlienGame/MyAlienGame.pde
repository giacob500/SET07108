PImage bg;

// Variables declaration
String gameState;
String controls;
Button startButton;
Button settingsButton;
Button creditsButton;
Button gameControlsButton;
Button exitButton;
Button confirmExit;
Button rejectExit;
Button back;
Alien mrAlien;
Spaceship spaceship;
Enemy enemy1;
Score score;
String savePreviousState;
int element = 0;
float bgCounter = 1;
float valueCompare = 1;
PVector circle = new PVector(width/2, height/2);
int circleWidth = 55;

void setup() {
  //frameRate(45);
  size(800, 800);
  gameState = "START";
  controls = "mouse";
  savePreviousState = "";
  startButton = new Button(width/2 - 150/2, height/2 - 100 - 75/2, 150, 75, "START", 200, 100, 10);
  settingsButton = new Button(width/2 - 150/2, height/2 - 75/2, 150, 75, "SETTINGS", 200, 100, 10);
  gameControlsButton = new Button(width/2 - 150/2, height/2 - 50 - 75/2, 150, 75, "CONTROLS", 200, 100, 10);
  creditsButton = new Button(width/2 - 150/2, height/2 + 50 - 75/2, 150, 75, "CREDITS", 200, 100, 10);
  exitButton = new Button(width/2 - 150/2, height/2 + 100 - 75/2, 150, 75, "EXIT GAME", 200, 100, 10);
  confirmExit = new Button(width/2 - 150/2 - 100, height/2 - 75/2, 150, 75, "Confirm", 200, 100, 10);
  rejectExit = new Button(width/2 - 150/2  + 100, height/2- 75/2, 150, 75, "Cancel", 200, 100, 10);
  back = new Button(25, 25, width/16, height/16, "◄", 200, 100, 10);
  // Inizialization of "Alien" object
  mrAlien = new Alien(100, 115, 400, 690);
  enemy1 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2, height / 2 - height / 6);
  score = new Score();
}

void draw() {
  clearBackground();
  if (gameState == "START") {    
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "WIN") {
    winGame();
  } else if (gameState == "LOSE") {
    loseGame();
  } else if (gameState == "SETTINGS") {
    gameSettings();
  } else if (gameState == "CREDITS") {
    gameCredits();
  } else if (gameState == "EXIT") {
    exitGame();
  }
  // Press ESC key
  /*
  if (keyPressed && key == 'y') {
   println("capted");
   = true;
   exitGame();    
   }
   circle(circle.x, circle.y, circleWidth);
   circle.x = mouseX;
   circle.y = mouseY;
   
   if(mousePressed){
   bodyXLoc = mouseX;
   bodyYLoc = mouseY;
   }
   */
}
void keyTyped() {
  if (key == 'y') {
    println("capted");
    savePreviousState = gameState;
    gameState = "EXIT";
  }
}

void keyPressed() {
  mrAlien.move(controls);
}

void mouseMoved() {
  mrAlien.move(controls);
}

void startGame() {
  // Put menu here
  background(155, 20, 0);  
  if (startButton.isClicked()) {
    gameState = "PLAY";
  }
  startButton.update();
  startButton.render();
  if (settingsButton.isClicked()) {
    gameState = "SETTINGS";
  }
  settingsButton.update();
  settingsButton.render();
  if (exitButton.isClicked()) {
    savePreviousState = gameState;
    gameState = "EXIT";
  }
  exitButton.update();
  exitButton.render();
  cursor(ARROW);
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
  // back button
  if (back.isClicked()) {
    gameState = "START";
  }
  back.update();
  back.render();
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
void gameSettings() {
  background(0, 220, 0);
  textSize(52);
  fill(255, 0, 0);
  text("SETTINGS", width / 2, height / 16);
  textSize(30);
  fill(0, 0, 255);
  text(controls, gameControlsButton.pos.x + (gameControlsButton.buttonWidth / 2), gameControlsButton.pos.y - 30);
  if (gameControlsButton.isClicked()) {
    gameControls();
  }
  gameControlsButton.update();
  gameControlsButton.render();
  if (creditsButton.isClicked()) {
    gameState = "CREDITS";
  }
  creditsButton.update();
  creditsButton.render();
  if (back.isClicked()) {
    gameState = "START";
  }
  back.update();
  back.render();
}
void gameControls() {
  if (controls == "keyboard")
    controls = "mouse";
  else if (controls == "mouse")
    controls = "keyboard";
}
void gameCredits() {
  background(0, 220, 0);
  textSize(52);
  fill(255, 0, 0);
  text("CREDITS", width / 2, height / 16);
  fill(0, 0, 255);
  textSize(20);
  String storeEveryLine = "";
  String[] lines = loadStrings("credits.txt");
  for (int i = 0; i < lines.length; i++) {
    storeEveryLine += lines[i] + "\n";
  }
  text(storeEveryLine, width / 2, height / 2);
  if (back.isClicked()) {
    gameState = "SETTINGS";
  }
  back.update();
  back.render();
}
void exitGame() {
  fill(200, 100, 10);
  rectMode(CENTER);
  rect(width / 2, height / 2 - confirmExit.buttonHeight / 2, (confirmExit.buttonWidth + confirmExit.buttonWidth / 2)*2, confirmExit.buttonHeight * 3);
  if (confirmExit.isClicked()) {
    exit();
  }
  confirmExit.update();
  confirmExit.render();
  if (rejectExit.isClicked()) {
    gameState = savePreviousState;
  }
  rejectExit.update();
  rejectExit.render();
}


void clearBackground() {
  fill(255);
  rect(0, 0, width, height);
}
