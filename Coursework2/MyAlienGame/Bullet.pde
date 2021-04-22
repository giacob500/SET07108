class Bullet {
  PVector pos = new PVector(0, 0);
  float extent;
  color colour;
  PVector posCopy = new PVector(0, 0);
  float extentCopy;
  boolean showBullet = false;
  float speed = 7.5; // 7.5

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
    showBullet = true;
    fill(colour);
    pos.x = xPostiton;
    pos.y = yPosition - spawnHeight;
  }

  void show() {
    if (showBullet == true) {
      fill(colour);
      circle(pos.x, pos.y, extent);
    }
  }

  void collision() { 
    showBullet = false;
    extent = extentCopy;
  }

  void move() {
    if (showBullet == true) {
      //remember to sobstitute 0 with height / 3
      if (pos.y > height / 3) {
        pos.y = pos.y - speed;
        //println(extent + " " + extentCopy);
        if(extent > 5){
          extent *= 0.98;
        }        
      } else {
        extent = 15;
        showBullet = false;
      }
    }
  }

  void resetBullet() {
    pos.x = posCopy.x;
    pos.y = posCopy.y;
    extent = extentCopy;
    showBullet = false;
  }
}
