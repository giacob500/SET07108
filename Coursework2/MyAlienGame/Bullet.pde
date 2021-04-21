class Bullet {
  PVector pos = new PVector(0, 0);
  float extent;
  color colour;
  boolean show = false;
  float speed = 7.5;

  // Constructor to create a bullet
  Bullet(int x, int y, int e, int r, int g, int b) {
    pos.x = x;
    pos.y = y;
    extent = e;
    colour = color(r, g, b);
  }

  void spawn(float xPostiton, float yPosition) {
    if (show == true) {
      fill(colour);
      pos.x = xPostiton;
      pos.y = yPosition;
    }
  }
  
  void show(){
     if (show == true) {
      fill(colour);
      circle(pos.x, pos.y, extent);
    }
  }
  
  void collision(){
  }

  void move() {
    if (show == true) {
      if (pos.y > 0) {
        pos.y = pos.y - speed;
        extent *= 0.99;
      }
      else{
        extent = 15;
        show = false;
      }
    }
  }
}
