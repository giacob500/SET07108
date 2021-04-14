// Variables declaration
Alien mrAlien;
Alien mrsAlien;
Alien babyAlien;
int element = 0;
float bgCounter = 1;
float valueCompare = 1;
int[][] stars = new int[100][2];

PImage bg;


void setup() {
  size(800, 800);
  //bg = loadImage("./images/ingame-background/bg (" + bgCounter + ").gif");
  // Inizialization of objects "Alien"
  mrAlien = new Alien(175, 200, 400, 650);
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
  //mrAlien.checkForBounce();
  //mrAlien.move();
}

void keyPressed() {
  mrAlien.move();
}
