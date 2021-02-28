Alien mrFrosty;
Alien mrsFrosty;
Alien babyFrosty;

void setup() {
  size(400, 400);
  mrFrosty = new Alien(75, 100, 200, 200);
  mrsFrosty = new Alien(35, 50, 100, 100);
  babyFrosty = new Alien(16, 25, 150, 235);
 
}

void draw() {
  background(0);
  stroke(0);
  fill(255);
  
 mrFrosty.drawBody();
 mrFrosty.drawHead();
 mrFrosty.checkForBounce();
 mrFrosty.move();
 
 mrsFrosty.drawBody();
 mrsFrosty.drawHead();
 mrsFrosty.checkForBounce();
 mrsFrosty.move();
 
 babyFrosty.drawBody();
 babyFrosty.drawHead();
 babyFrosty.checkForBounce();
 babyFrosty.move();

}//end draw

 
