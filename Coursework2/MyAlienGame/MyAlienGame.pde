import processing.sound.*;
SoundFile winSound;
SoundFile gameOverSound;
SoundFile shootSound;
SoundFile hitEnemySound;
SoundFile selectSound;
SoundFile switchSound;
SoundFile cancelSound;
SoundFile menuBkgSound;
SoundFile ingameBkgSound;

PImage ingameBkg;
PImage menuTitleBkg;
PImage menuBkg;
PImage explosion;
PImage gameover;
PImage victory;
PImage musicOn;
PImage musicOff;
PImage backImage;

PFont gameFont;

// Variables declaration
String gameState;
String controls;
Button startButton;
Button settingsButton;
Button gameControlsButton;
Button chooseSpaceshipButton;
Button instructionsButton;
Button creditsButton;
Button musicVolumeButton;
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
Enemy enemy2;
Enemy enemy3;
Score score;
Timer timer;
int spaceshipNumber = 1;
boolean incrementScore = false;
String savePreviousState;
String cursor = "ARROW";
boolean cursorCounter = false;
boolean triggerExplosion = false;
boolean volumeSwitch = true;
boolean oldVolumeSwitch = true;
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
  menuTitleBkg = loadImage("./images/menu-bg-title.jpg");
  explosion = loadImage("./images/enemy-explodes.png");
  gameover = loadImage("./images/game-over.png");
  victory = loadImage("./images/victory-cup.png");
  musicOn = loadImage("./images/sound-on.png");
  musicOff = loadImage("./images/sound-off.png");
  backImage = loadImage("./images/back.png");
  gameFont = loadFont("MyriadPro-Cond-48.vlw");
  winSound = new SoundFile(this, "./sounds/win.wav");
  gameOverSound = new SoundFile(this, "./sounds/game-over.wav");
  shootSound = new SoundFile(this, "./sounds/shoot.wav");
  hitEnemySound = new SoundFile(this, "./sounds/hitted-enemy.wav");
  selectSound = new SoundFile(this, "./sounds/menu-selection.wav");
  switchSound = new SoundFile(this, "./sounds/switch-controls.wav");
  cancelSound = new SoundFile(this, "./sounds/cancel.mp3");
  menuBkgSound = new SoundFile(this, "./sounds/menu-background-theme.wav");
  ingameBkgSound = new SoundFile(this, "./sounds/ingame-background-theme.wav");
  startButton = new Button(width/2 - 150/2, height/2 - 75/2, 150, 75, "START", 3, 127, 252);
  settingsButton = new Button(width/2 - 150/2, height/2 + 100 - 75/2, 150, 75, "SETTINGS", 3, 127, 252);
  gameControlsButton = new Button(width/2 - 200/2, height/2 - 100 - 75/2, 200, 75, "CONTROLS", 3, 127, 252);  
  instructionsButton = new Button(width/2  - 250 - 200/2, height/2 - 100 - 75/2, 200, 75, "HOW TO PLAY", 3, 127, 252);
  creditsButton = new Button(width/2 + 250 - 200/2, height/2 - 100 - 75/2, 200, 75, "CREDITS", 3, 127, 252);
  musicVolumeButton = new Button(width/2 + 125 - 125/2, height/2 + 100, 125, 125, "", 3, 127, 252);
  exitButton = new Button(width/2 - 150/2, height/2 + 200 - 75/2, 150, 75, "EXIT GAME", 3, 127, 252);
  confirmExit = new Button(width/2 - 150/2 - 100, height/2 - 75/2, 150, 75, "Confirm", 3, 127, 252);
  rejectExit = new Button(width/2 - 150/2  + 100, height/2- 75/2, 150, 75, "Cancel", 3, 127, 252);
  back = new Button(25, 25, width/16, height/16, "", 3, 127, 252);
  // Inizialization of "Alien" object
  mrAlien = new Alien(100, 115, 400, 690);
  spaceship = new Spaceship(mrAlien.bodyWidth * 2, mrAlien.bodyHeight * 2, mrAlien.bodyXLoc, mrAlien.bodyYLoc);
  chooseSpaceshipButton = new Button(width/2 - 125 - 125/2, height/2 + 100, 125, 125, "", 3, 127, 252);
  //spaceship = new Spaceship(50, 50, 400, 400);
  bullet1 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
  bullet2 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
  bullet3 = new Bullet(mrAlien.bodyXLoc, mrAlien.bodyYLoc, 20, 255, 255, 0);
  enemy1 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2, height / 2 - height / 6, 1.01);
  enemy2 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2 - 50, height / 2 - height / 6, 1.005);
  enemy3 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2 + 50, height / 2 - height / 6, 1.008);
  score = new Score();
  timer = new Timer(70, width / 2, 45, 35);
  ingameBkgSound.loop();
  textFont(gameFont, 24);
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
    if (gameState == "PLAY" || gameState == "LOSE" || gameState == "WIN") {
      cursor = "ARROW";
      gameState = "START";
    }
  } else if (key == ' ' && gameState == "PLAY") {
    // SHOOT BULLET
    shootSound.play();
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
  } else if ((key == 'p' || key == 'P') && (gameState == "LOSE" || gameState == "WIN")) {
    resetGame();
    gameState = "PLAY";
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
  background(menuTitleBkg);  
  if (startButton.isClicked()) {
    selectSound.play();
    if(controls == "mouse")
    cursor = "NONE";
    gameState = "PLAY";
    resetGame();
  }
  startButton.update();
  startButton.render();
  if (settingsButton.isClicked()) {
    selectSound.play();
    gameState = "SETTINGS";
  }
  settingsButton.update();
  settingsButton.render();
  if (exitButton.isClicked()) {
    selectSound.play();
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
    selectSound.play();
    gameState = "START";
    cursor = "ARROW";
  }
  back.update();
  back.render();
  drawBackIcon();
  // Calling Alien functions to show aliens on screen  
  spaceship.spawnSpaceship(mrAlien.bodyXLoc, mrAlien.bodyYLoc, spaceshipNumber);
  mrAlien.drawBody();
  bullet1.show();
  bullet1.move();  
  bullet2.show();
  bullet2.move();
  bullet3.show();
  bullet3.move();
  enemy1.drawBody();
  enemy1.move(mrAlien.bodyWidth, mrAlien.bodyHeight);
  enemy2.drawBody();
  enemy2.move(mrAlien.bodyWidth, mrAlien.bodyHeight);
  enemy3.drawBody();
  enemy3.move(mrAlien.bodyWidth, mrAlien.bodyHeight);
  score.show();
  timer.show();
  timer.countDown();  
  // Check for collisions
  checkForCollision();
  if (timer.getTime() <= 0.01) {
    winSound.play();
    gameState = "WIN";
  }
}
void checkForCollision() {
  // Check collision for enemy 1
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
    hitEnemySound.play();
    score.increaseScore();
    imageMode(CENTER);
    //image(explosion, enemy1.bodyXLoc, enemy2.bodyYLoc, 150, 150);
    image(explosion, width/3, height/3, 150, 150);
    incrementScore = false;
  }
  // Check collision for enemy 2
  if (dist(enemy2.bodyXLoc, enemy2.bodyYLoc, bullet1.pos.x, bullet1.pos.y) <= enemy2.bodyWidth + bullet1.extent && bullet1.showBullet == true && enemy2.showEnemy == true) {
    enemy2.collision();
    //bullet1.showBullet = false;
    bullet1.collision();
    incrementScore = true;
  } else if (dist(enemy2.bodyXLoc, enemy2.bodyYLoc, bullet2.pos.x, bullet2.pos.y) <= enemy2.bodyWidth + bullet2.extent && bullet2.showBullet == true && enemy2.showEnemy == true) {
    enemy2.collision();    
    //bullet2.showBullet = false;
    bullet2.collision();
    incrementScore = true;
  } else if (dist(enemy2.bodyXLoc, enemy2.bodyYLoc, bullet3.pos.x, bullet3.pos.y) <= enemy2.bodyWidth + bullet3.extent && bullet3.showBullet == true && enemy2.showEnemy == true) {
    enemy2.collision();
    //bullet3.showBullet = false;
    bullet3.collision();
    incrementScore = true;
  } else if (incrementScore == true) {
    hitEnemySound.play();
    score.increaseScore();
    imageMode(CENTER);
    //image(explosion, enemy1.bodyXLoc, enemy2.bodyYLoc, 150, 150);
    image(explosion, width/3, height/3, 150, 150);
    incrementScore = false;
  }
  // Check collision for enemy 3
  if (dist(enemy3.bodyXLoc, enemy3.bodyYLoc, bullet1.pos.x, bullet1.pos.y) <= enemy3.bodyWidth + bullet1.extent && bullet1.showBullet == true && enemy3.showEnemy == true) {
    enemy3.collision();
    //bullet1.showBullet = false;
    bullet1.collision();
    incrementScore = true;
  } else if (dist(enemy3.bodyXLoc, enemy3.bodyYLoc, bullet2.pos.x, bullet2.pos.y) <= enemy3.bodyWidth + bullet2.extent && bullet2.showBullet == true && enemy3.showEnemy == true) {
    enemy3.collision();    
    //bullet2.showBullet = false;
    bullet2.collision();
    incrementScore = true;
  } else if (dist(enemy3.bodyXLoc, enemy3.bodyYLoc, bullet3.pos.x, bullet3.pos.y) <= enemy3.bodyWidth + bullet3.extent && bullet3.showBullet == true && enemy3.showEnemy == true) {
    enemy3.collision();
    //bullet3.showBullet = false;
    bullet3.collision();
    incrementScore = true;
  } else if (incrementScore == true) {
    hitEnemySound.play();
    score.increaseScore();
    imageMode(CENTER);
    //image(explosion, enemy1.bodyXLoc, enemy2.bodyYLoc, 150, 150);
    image(explosion, width/3, height/3, 150, 150);
    incrementScore = false;
  }
  // Chek if alien dies
  //  && mrAlien.showAlien == true
  if (dist(enemy1.bodyXLoc, enemy1.bodyYLoc, mrAlien.bodyXLoc, mrAlien.bodyYLoc) * 1.5 <= enemy1.bodyWidth + mrAlien.bodyWidth && enemy1.showEnemy == true
    || dist(enemy2.bodyXLoc, enemy2.bodyYLoc, mrAlien.bodyXLoc, mrAlien.bodyYLoc) * 1.5 <= enemy2.bodyWidth + mrAlien.bodyWidth && enemy2.showEnemy == true
    || dist(enemy3.bodyXLoc, enemy3.bodyYLoc, mrAlien.bodyXLoc, mrAlien.bodyYLoc) * 1.5 <= enemy3.bodyWidth + mrAlien.bodyWidth && enemy3.showEnemy == true) {
    mrAlien.collision();
    gameOverSound.play();
    gameState = "LOSE";
  }
  //println(dist(enemy1.bodyXLoc, enemy1.bodyYLoc, bullet2.pos.x, bullet2.pos.y));
}
void winGame() {
  background(ingameBkg);
  textSize(52);
  fill(255, 255, 0);
  textAlign(CENTER);
  text("YOU WON!!!", width / 2, height / 5);
  imageMode(CENTER);
  image(victory, width / 2, height / 3, width / 8, height / 8);
  textSize(25);
  text("Press 'M' to go to main menu.\nPress 'P' to quickly restart.\nPress 'Q' to exit the game.", width / 2, height / 2);
  textSize(35);
  text("Score:\n" + score.getScore(), width / 2, (height / 4) * 3);
}
void loseGame() {  
  background(ingameBkg);
  textSize(52);
  fill(255, 0, 0);
  textAlign(CENTER);
  text("YOU LOST", width / 2, height / 5);
  imageMode(CENTER);
  image(gameover, width / 2, height / 3, width / 8, height / 8);
  textSize(25);
  text("Press 'M' to go to main menu.\nPress 'P' to quickly restart.\nPress 'Q' to exit the game.", width / 2, height / 2);
  textSize(35);
  text("Score:\n" + score.getScore(), width / 2, (height / 4) * 3);
}
void resetGame() {
  mrAlien.resetAlien();
  bullet1.resetBullet();
  bullet2.resetBullet();
  bullet3.resetBullet();
  enemy1.reset();
  enemy2.reset();
  enemy3.reset();
  score.resetScore();
  timer.resetTimer();
}
void gameSettings() {
  background(menuBkg);
  textSize(52);
  fill(255, 0, 0);
  text("SETTINGS", width / 2, height / 16);
  textSize(30);
  fill(0, 255, 0);
  text(controls, gameControlsButton.pos.x + (gameControlsButton.buttonWidth / 2), gameControlsButton.pos.y - 30);
  textSize(25);
  text("Choose spaceship:", chooseSpaceshipButton.pos.x + (chooseSpaceshipButton.buttonWidth / 2), chooseSpaceshipButton.pos.y - 30);
  text("Game music:", musicVolumeButton.pos.x + (musicVolumeButton.buttonWidth / 2), musicVolumeButton.pos.y - 30);
  if (gameControlsButton.isClicked()) {
    gameControls();
  }
  gameControlsButton.update();
  gameControlsButton.render();
  if (musicVolumeButton.isClicked()) {
    switchSound.play();
    volumeSwitch = !volumeSwitch;
  }
  musicVolumeButton.update();
  musicVolumeButton.render();
  musicController(musicVolumeButton.pos.x + musicVolumeButton.buttonWidth * 0.50, musicVolumeButton.pos.y + musicVolumeButton.buttonHeight * 0.50, musicVolumeButton.buttonWidth * 0.75, musicVolumeButton.buttonHeight * 0.75, volumeSwitch);
  if (instructionsButton.isClicked()) {
    selectSound.play();
    gameState = "INSTRUCTIONS";
  }
  instructionsButton.update();
  instructionsButton.render();
  if (chooseSpaceshipButton.isClicked()) {
    switchSound.play();
    if (spaceshipNumber == 4)
      spaceshipNumber = 1;
    else
      spaceshipNumber++;
  }
  chooseSpaceshipButton.update();
  chooseSpaceshipButton.render();
  spaceship.spawnOnButton(chooseSpaceshipButton.pos.x, chooseSpaceshipButton.pos.y, chooseSpaceshipButton.buttonWidth, chooseSpaceshipButton.buttonHeight, spaceshipNumber);
  if (creditsButton.isClicked()) {
    selectSound.play();
    gameState = "CREDITS";
  }
  creditsButton.update();
  creditsButton.render();
  if (back.isClicked()) {
    selectSound.play();
    gameState = "START";
  }
  back.update();
  back.render();
  drawBackIcon();
}
void gameControls() {
  switchSound.play();
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
    selectSound.play();
    gameState = "SETTINGS";
  }
  back.update();
  back.render();
  drawBackIcon();
}

void gameCredits() {
  background(menuBkg);
  textSize(52);
  fill(255, 0, 0);
  text("CREDITS", width / 2, height / 16);
  fill(0, 255, 0);
  textSize(24);
  String storeFileLines = "";
  String[] lines = loadStrings("credits.txt");
  for (int i = 0; i < lines.length; i++) {
    storeFileLines += lines[i] + "\n";
  }
  text(storeFileLines, width / 2, height / 2);
  textSize(18);
  text("©2021 All rights reserved.", width / 2, height - (height / 16));
  if (back.isClicked()) {
    selectSound.play();
    gameState = "SETTINGS";
  }
  back.update();
  back.render();
  drawBackIcon();
}
void exitGame() {
  if (savePreviousState == "PLAY" || savePreviousState == "LOSE") {
    background(ingameBkg);
  } else {
    background(menuBkg);
  }
  fill(50, 1, 115);
  strokeWeight(1);
  rectMode(CENTER);
  rect(width / 2, height / 2 - confirmExit.buttonHeight / 2, (confirmExit.buttonWidth + confirmExit.buttonWidth / 2)*2, confirmExit.buttonHeight * 3);
  textSize(30);
  fill(255);
  text("Are you sure?", width / 2, height / 2 - confirmExit.buttonHeight * 1.25);
  if (confirmExit.isClicked()) {
    selectSound.play();
    exit();
  }  
  confirmExit.update();
  confirmExit.render();
  if (rejectExit.isClicked()) {
    cancelSound.play();
    gameState = savePreviousState;
  }
  rejectExit.update();
  rejectExit.render();
}

void musicController(float bodyXLoc, float bodyYLoc, float bWidth, float bHeight, boolean volumeSwitch) {
  imageMode(CENTER);
  if (volumeSwitch == true) {
    image(musicOn, bodyXLoc, bodyYLoc, bWidth, bHeight);
  } else if (volumeSwitch == false) {
    image(musicOff, bodyXLoc, bodyYLoc, bWidth, bHeight);
  }
}

void drawBackIcon() {
  imageMode(CORNER);
  image(backImage, back.pos.x + (back.buttonWidth * 0.25) / 2, back.pos.y + (back.buttonHeight * 0.25) / 2, back.buttonWidth * 0.75, back.buttonHeight * 0.75);
}

void clearBackground() { 
  if (oldVolumeSwitch == false && volumeSwitch == true) {
    ingameBkgSound.play();
    oldVolumeSwitch = true;
  } else if (oldVolumeSwitch == true && volumeSwitch == false) {
    ingameBkgSound.pause();
    oldVolumeSwitch = false;
  }
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
