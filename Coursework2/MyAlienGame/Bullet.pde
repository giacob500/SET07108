class Bullet {
  PVector pos = new PVector(0, 0);
  float extent;
  color colour;
  PVector posCopy = new PVector(0, 0);
  float extentCopy;
  boolean show = false;
  float speed = 7.5;

  // Constructor to create a bullet
  Bullet(int x, int y, int e, int r, int g, int b) {
    pos.x = x;
    pos.y = y;
    extent = e;
    posCopy.x = pos.x;
    posCopy.y = pos.y;
    extentCopy = extent;
    colour = color(r, g, b);
  }

  void spawn(float xPostiton, float yPosition, int spawnHeight) {
    if (show == true) {
      fill(colour);
      pos.x = xPostiton;
      pos.y = yPosition - spawnHeight;
    }
  }

  void show() {
    if (show == true) {
      fill(colour);
      circle(pos.x, pos.y, extent);
    }
  }

  void collision() {
    // hide bullet
  }

  void move() {
    if (show == true) {
      if (pos.y > height / 3) {
        pos.y = pos.y - speed;
        extent *= 0.98;
      } else {
        extent = 15;
        show = false;
      }
    }
  }

  void resetBullet() {
    pos.x = posCopy.x;
    pos.y = posCopy.y;
    extent = extentCopy;
    show = false;
  }
}
