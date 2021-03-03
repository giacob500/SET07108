Alien mrAlien;
Alien mrsAlien;
Alien babyAlien;

void setup() {
  size(600, 600);
  mrAlien = new Alien(175, 200, 300, 300);
  //mrsAlien = new Alien(35, 50, 100, 100);
  //babyAlien = new Alien(16, 25, 150, 235);
 
}

void draw() {
  background(0,0,40);
  stroke(0);
  fill(255);
  strokeWeight(2); // Not obligatory, could be deleted
  /* Doesn't work
  stroke(10);
  noSmooth();
  point(300, 200);
  point(85, 20);
  point(85, 75);
  point(30, 75);*/
 
 mrAlien.drawBody();
 mrAlien.drawFace();
 mrAlien.checkForBounce();
 mrAlien.move();
 /*
 mrsAlien.drawBody();
 mrsAlien.drawFace();
 mrsAlien.checkForBounce();
 mrsAlien.move();
 
 babyAlien.drawBody();
 babyAlien.drawFace();
 babyAlien.checkForBounce();
 babyAlien.move();
*/
}//end draw

 
