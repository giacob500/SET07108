PImage bg;

// Variables declaration
Alien mrAlien;
Score score;
Enemy enemy1; 
int element = 0;
float bgCounter = 1;
float valueCompare = 1;
int[][] stars = new int[100][2];

void setup() {
  size(800, 800);
  //bg = loadImage("./images/ingame-background/bg (" + bgCounter + ").gif");
  // Inizialization of objects "Alien"
  mrAlien = new Alien(175, 200, 400, 690);  
  enemy1 = new Enemy(mrAlien.bodyWidth, mrAlien.bodyHeight, width / 2, height / 2 - height / 6);
  score = new Score();
  /*
  // Loop to populate the array with random coordinates
   for (int i = 0; i < 100; i++) {
   if (element == 0) {
   stars[i][element] = (int)random(width);
   element++;
   }
   if (element == 1) {
   stars[i][element] = (int)random(height);
   element--;
   }
   }
   */
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
  stroke(0);
  fill(255);
  // Specifies stroke thickness in pixels
  strokeWeight(2); 
  // Draws stars using coordinates array
  stroke(255);
  for (int i = 0; i < 100; i++) {
    point(stars[i][0], stars[i][1]);
  }

  // Calling Alien functions to show aliens on screen
  mrAlien.drawBody();
  mrAlien.drawFace();
  enemy1.drawBody();
  score.display();  
  enemy1.move();
  //mrAlien.checkForBounce();
  //mrAlien.move();
}

void keyPressed() {
  mrAlien.move();
}
