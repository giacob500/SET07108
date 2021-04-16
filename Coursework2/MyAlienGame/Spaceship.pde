PImage img;

class Spaceship{
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  
  
  Spaceship(){
    this.bodyWidth = 75;
    this.bodyHeight = 100;
    this.bodyXLoc = 400;
    this.bodyYLoc = 650;
  }
  
  Spaceship(int bWidth, int bHeight, int startX, int startY) {
    this.bodyWidth = bWidth;
    this.bodyHeight = bHeight;
    this.bodyXLoc = startX;
    this.bodyYLoc = startY;
  }

  void spawnSpaceship(int bodyYLoc, int bodyHeight){
    /*
  fill(255);
  line(width/2, 0, width/2, height);
  */
  fill(155);
  rect(bodyXLoc-25, bodyYLoc-155, 50, 155);
  img = loadImage("./images/spaceship_1.png");
  image(img, width / 2 - 244, bodyYLoc - bodyHeight / 2);
  }
}
