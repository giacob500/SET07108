// Variables declaration
Alien mrAlien;
Alien mrsAlien;
Alien babyAlien;
int element = 0;
int[][] stars = new int[100][2];

void setup() {
  size(600, 600);
  // Inizialization of objects "Alien"
  mrAlien = new Alien(175, 200, 300, 300);
  mrsAlien = new Alien(100, 120, 100, 100);
  babyAlien = new Alien(50, 50, 150, 235);
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
}

void draw() {
  background(0, 0, 40);
  stroke(0);
  fill(255);
  // Specifies stroke thickness in pixels
  strokeWeight(2); 
  // Creates stars using coordinates array
  stroke(255);
  for (int i = 0; i < 100; i++) {
    point(stars[i][0], stars[i][1]);
  }
  
  // Calling Alien functions to show aliens on screen
  mrAlien.drawBody();
  mrAlien.drawFace();
  mrAlien.checkForBounce();
  mrAlien.move();

  mrsAlien.drawBody();
  mrsAlien.drawFace();
  mrsAlien.checkForBounce();
  mrsAlien.move();

  babyAlien.drawBody();
  babyAlien.drawFace();
  babyAlien.checkForBounce();
  babyAlien.move();
}
