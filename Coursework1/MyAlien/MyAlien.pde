Alien mrAlien;
Alien mrsAlien;
Alien babyAlien;
int element = 0;
int[][] stars = new int[100][2];

void setup() {
  size(600, 600);
  mrAlien = new Alien(175, 200, 300, 300);
  mrsAlien = new Alien(100, 120, 100, 100);
  babyAlien = new Alien(50, 50, 150, 235);
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
  strokeWeight(2); // Not obligatory, could be deleted  
  stroke(255);
  for (int i = 0; i < 100; i++) {
    point(stars[i][0], stars[i][1]);
  }

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
}//end draw
