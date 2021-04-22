PImage ingameBkg;
PImage menuBkg;
PImage explosion;

// Variables declaration
String gameState;
String controls;
Button startButton;
Button settingsButton;
Button gameControlsButton;
Button instructionsButton;
Button creditsButton;
Button exitButton;
Button confirmExit;
Button rejectExit;
Button back;
Alien mrAlien;
Bullet bullet1;
Bullet bullet2;
Bullet bullet3;
Spaceship spaceship;
Enemy enemy1;
Score score;
boolean incrementScore = false;
String savePreviousState;
String cursor = "ARROW";
boolean cursorCounter = false;
boolean triggerExplosion = false;
int element = 0;
float ingameBkgCounter = 1;
float valueCompare = 1;
PVector circle = new PVector(width/2, height/2);
int circleWidth = 55;

void setup() {
  frameRate(1000);
  size(800, 800);
  gameState = "START";
  controls = "mouse";
  savePreviousState = "";
  menuBkg = loadImage("./images/menu-bg.jpg");
  explosion = loadImage("./images/enemy-explodes.png");
  startButton = new Button(width/2 - 150/2, height/2 - 100 - 75/2, 150, 75, "START", 200, 100, 10);
  settingsButton = new Button(width/2 - 150/2, height/2 - 75/2, 150, 75, "SETTINGS", 200, 100, 10);
  gameControlsButton = new Button(width/2 - 175/2, height/2 - 100 - 75/2, 175, 75, "CONTROLS", 200, 100, 10);
  instructionsButton = new Button(width/2 - 175/2, height/2 - 75/2, 175, 75, "HOW TO PLAY", 200, 100, 10);
  creditsButton = new Button(width/2 - 175/2, height/2 + 100 - 75/2, 175, 75, "CREDITS", 200, 100, 10);
  exitButton = new Button(width/2 - 150/2, height/2 + 100 - 75/2, 150, 75, "EXIT GAME", 200, 100, 10);
  confirmExit = new Button(width/2 - 150/2 - 100, height/2 - 75/2, 150, 75, "Confirm", 200, 100, 10);
  rejectExit = new Button(width/2 - 150/2  + 100, height/2- 75/2, 150, 75, "Cancel", 200, 100, 10);
  back = new Button(25, 25, width/16, height/16, "◄", 200, 100, 10);
  // Inizialization of "Alien" object
  mrAlien = new Alien(100, 115, 400, 690);
  bullet1 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
  bullet2 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
  bullet3 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
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
  } else if (gameState == "INSTRUCTIONS") {
    HowToPlay();
  } else if (gameState == "CREDITS") {
    gameCredits();
  } else if (gameState == "EXIT") {
    exitGame();
  }
}
void keyTyped() {
  if (key == 'q' || key == 'Q') {
    if (gameState != "EXIT") {
      savePreviousState = gameState;
      gameState = "EXIT";
    }
  } else if (key == 'm' || key == 'M') {
    if (gameState == "PLAY" || gameState == "LOSE") {
      cursor = "ARROW";
      gameState = "START";
    }
  } else if (key == ' ') {
    if (gameState == "LOSE") {
      resetGame();
      gameState = "PLAY";      
    } else {
      // SHOOT BULLET
      if (bullet1.showBullet == false) {
        //bullet1.showBullet = true;
        bullet1.spawn(mrAlien.bodyXLoc, mrAlien.bodyYLoc, mrAlien.bodyHeight);
      } else if (bullet2.showBullet == false) {
        //bullet2.showBullet = true;
        bullet2.spawn(mrAlien.bodyXLoc, mrAlien.bodyYLoc, mrAlien.bodyHeight);
      } else if (bullet3.showBullet == false) {
        // bullet3.showBullet = true;
        bullet3.spawn(mrAlien.bodyXLoc, mrAlien.bodyYLoc, mrAlien.bodyHeight);
      }
    }
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

  background(menuBkg);  
  if (startButton.isClicked()) {
    cursor = "NONE";
    gameState = "PLAY";
    resetGame();
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
}

void playGame() {
  // to save program performance
  if (valueCompare == (int)ingameBkgCounter) {
    ingameBkg = loadImage("./images/ingame-background/bg (" + (int)ingameBkgCounter + ").gif");
  }
  background(ingameBkg);
  if (ingameBkgCounter < 61)
    ingameBkgCounter+= 0.5;
  else
    ingameBkgCounter = 1;
  valueCompare = ingameBkgCounter;
  // back button
  if (back.isClicked()) {
    gameState = "START";
    cursor = "ARROW";
  }
  back.update();
  back.render();
  // Check for collisions
  checkForCollision();
  // Calling Alien functions to show aliens on screen
  mrAlien.drawBody();
  bullet1.show();
  bullet1.move();  
  bullet2.show();
  bullet2.move();
  bullet3.show();
  bullet3.move();
  enemy1.drawBody();
  enemy1.move(mrAlien.bodyWidth, mrAlien.bodyHeight);  
  score.display();
  /*
  if (triggerExplosion == true) {
   println("triggerExplosion is " + triggerExplosion);
   // explosion for enemy
   //image(explosion, enemy1.bodyXLoc - enemy1.bodyWidth / 2, enemy1.bodyYLoc - enemy1.bodyHeight / 2, enemy1.bodyXLoc + enemy1.bodyWidth / 2, enemy1.bodyYLoc + enemy1.bodyHeight / 2);
   image(explosion, width/2, height/2, width/2 + 2, height/2);
   println("image printed - " + score.points);
   triggerExplosion = false;
   }
   */
}
void checkForCollision() {
  //println("tomare");
  if (dist(enemy1.bodyXLoc, enemy1.bodyYLoc, bullet1.pos.x, bullet1.pos.y) <= enemy1.bodyWidth + bullet1.extent && bullet1.showBullet == true && enemy1.showEnemy == true) {
    enemy1.collision();
    //bullet1.showBullet = false;
    bullet1.collision();
    incrementScore = true;
  } else if (dist(enemy1.bodyXLoc, enemy1.bodyYLoc, bullet2.pos.x, bullet2.pos.y) <= enemy1.bodyWidth + bullet2.extent && bullet2.showBullet == true && enemy1.showEnemy == true) {
    enemy1.collision();    
    //bullet2.showBullet = false;
    bullet2.collision();
    incrementScore = true;
  } else if (dist(enemy1.bodyXLoc, enemy1.bodyYLoc, bullet3.pos.x, bullet3.pos.y) <= enemy1.bodyWidth + bullet3.extent && bullet3.showBullet == true && enemy1.showEnemy == true) {
    enemy1.collision();
    //bullet3.showBullet = false;
    bullet3.collision();
    incrementScore = true;
  } else if (incrementScore == true) {
    score.increaseScore();
    image(explosion, enemy1.bodyXLoc - enemy1.bodyWidth / 2, enemy1.bodyYLoc - enemy1.bodyHeight / 2, enemy1.bodyXLoc + enemy1.bodyWidth / 2, enemy1.bodyYLoc + enemy1.bodyHeight / 2);
    incrementScore = false;
  }
  // Chek if alien dies
  if (dist(enemy1.bodyXLoc, enemy1.bodyYLoc, mrAlien.bodyXLoc, mrAlien.bodyYLoc) <= enemy1.bodyWidth + mrAlien.bodyWidth && mrAlien.showAlien == true && enemy1.showEnemy == true) {
    mrAlien.collision();
    gameState = "LOSE";
  }
  //println(dist(enemy1.bodyXLoc, enemy1.bodyYLoc, bullet2.pos.x, bullet2.pos.y));
}
void winGame() {
}
void loseGame() {
  background(ingameBkg);
  textSize(52);
  fill(255, 0, 0);
  textAlign(CENTER);
  text("YOU LOST", width / 2, height / 5);
  textSize(20);
  text("Press 'M' to go to main menu.\nPress spacebar to quickly restart.", width / 2, height / 2);
}
void resetGame() {
  mrAlien.resetAlien();
  bullet1.resetBullet();
  bullet2.resetBullet();
  bullet3.resetBullet();
  enemy1.reset();
  score.resetScore();
}
void gameSettings() {
  background(menuBkg);
  textSize(52);
  fill(255, 0, 0);
  text("SETTINGS", width / 2, height / 16);
  textSize(30);
  fill(0, 255, 0);
  text(controls, gameControlsButton.pos.x + (gameControlsButton.buttonWidth / 2), gameControlsButton.pos.y - 30);
  if (gameControlsButton.isClicked()) {
    gameControls();
  }
  gameControlsButton.update();
  gameControlsButton.render();
  if (instructionsButton.isClicked()) {
    gameState = "INSTRUCTIONS";
  }
  instructionsButton.update();
  instructionsButton.render();
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
void HowToPlay() {
  background(menuBkg);
  textSize(52);
  fill(255, 0, 0);
  text("HOW TO PLAY", width / 2, height / 16);
  fill(0, 255, 0);
  textSize(25);
  String instructions = "";
  if (controls == "mouse") {
    instructions =
      "Drag mouse inside the game window to move the alien.\n";
  } else if (controls == "keyboard") {
    instructions =
      "Press up arrow key (↑) to move foreward\n" +
      "press down arrow key (↓) to move backward\n" +
      "press right arrow key (→) to move right\n" +
      "press left arrow key (←) to move left.\n";
  }
  instructions += "Press spacebar to shoot.\n\nWhile in-game press 'M' to go back at main menu.\nPress 'Q' to exit the game.";
  text(instructions, width / 2, height / 2);
  if (back.isClicked()) {
    gameState = "SETTINGS";
  }
  back.update();
  back.render();
}

void gameCredits() {
  background(menuBkg);
  textSize(52);
  fill(255, 0, 0);
  text("CREDITS", width / 2, height / 16);
  fill(0, 255, 0);
  textSize(20);
  String storeFileLines = "";
  String[] lines = loadStrings("credits.txt");
  for (int i = 0; i < lines.length; i++) {
    storeFileLines += lines[i] + "\n";
  }
  text(storeFileLines, width / 2, height / 2);
  if (back.isClicked()) {
    gameState = "SETTINGS";
  }
  back.update();
  back.render();
}
void exitGame() {
  if (savePreviousState == "PLAY" || savePreviousState == "LOSE") {
    background(ingameBkg);
  } else {
    background(menuBkg);
  }
  fill(200, 100, 10);
  strokeWeight(1);
  rectMode(CENTER);
  rect(width / 2, height / 2 - confirmExit.buttonHeight / 2, (confirmExit.buttonWidth + confirmExit.buttonWidth / 2)*2, confirmExit.buttonHeight * 3);
  textSize(30);
  fill(0);
  text("Are you sure?", width / 2, height / 2 - (confirmExit.buttonHeight / 2) * 3);
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
  if (cursorCounter == true)
    cursor(HAND);
  else {
    if (cursor == "ARROW") {
      cursor(ARROW);
    } else if (cursor == "HAND") {
      cursor(HAND);
    } else if (cursor == "NONE") {
      noCursor();
    }
  }
  cursorCounter = false;
  fill(255);
  strokeWeight(1);
  rect(0, 0, width, height);
}
