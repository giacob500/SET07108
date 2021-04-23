
class Spaceship {
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  PImage spaceship1;
  PImage spaceship2;
  PImage spaceship3;
  PImage spaceship4;


  Spaceship() {
    this.bodyWidth = 75;
    this.bodyHeight = 100;
    this.bodyXLoc = 400;
    this.bodyYLoc = 650;
    this.spaceship1 = loadImage("./images/spaceships/spaceship_1_centered.png");
    this.spaceship2 = loadImage("./images/spaceships/spaceship_2.png");
    this.spaceship3 = loadImage("./images/spaceships/spaceship_3.png");
    this.spaceship4 = loadImage("./images/spaceships/spaceship_4.png");
  }

  Spaceship(int bWidth, int bHeight, int startX, int startY) {
    this.bodyWidth = bWidth;
    this.bodyHeight = bHeight;
    this.bodyXLoc = startX;
    this.bodyYLoc = startY;
    this.spaceship1 = loadImage("./images/spaceships/spaceship_1_centered.png");
    this.spaceship2 = loadImage("./images/spaceships/spaceship_2.png");
    this.spaceship3 = loadImage("./images/spaceships/spaceship_3.png");
    this.spaceship4 = loadImage("./images/spaceships/spaceship_4.png");
  }

  void spawnSpaceship(int bodyXLoc, int bodyYLoc, int whichOne) {
    imageMode(CENTER);
    if (whichOne == 1)
      image(spaceship1, bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
    else if (whichOne == 2)
      image(spaceship2, bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
    else if (whichOne == 3)
      image(spaceship3, bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
    else if (whichOne == 4)
      image(spaceship4, bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
  }

  void spawnOnButton(float bodyXLoc, float bodyYLoc, float bWidth, float bHeight, int whichOne) {
    imageMode(CORNER);
    if (whichOne == 1)
      image(spaceship1, bodyXLoc, bodyYLoc, bWidth, bHeight);
    else if (whichOne == 2)
      image(spaceship2, bodyXLoc, bodyYLoc, bWidth, bHeight);
    else if (whichOne == 3)
      image(spaceship3, bodyXLoc, bodyYLoc, bWidth, bHeight);
    else if (whichOne == 4)
      image(spaceship4, bodyXLoc, bodyYLoc, bWidth, bHeight);
  }
}
