class Score {
  int size;
  int positionX;
  int positionY;
  int points;

  // Constructors
  Score () {
    this.points = 0;
    this.positionX = width - 150;
    this.positionY = 45;
    this.size= 35;
  }

  Score (int points, int positionX, int positionY, int size) {
    this.points = points;    
    this.positionX = positionX;
    this.positionY = positionY;
    this.size= size;
  }

  void display() {
    textAlign(CORNER, CORNER);
    textSize(35);
    fill(255, 255, 0);
    text("Score: " + points, positionX, positionY);    
  }
  
  void increaseScore(){
    points++;
  }
  
  void resetScore(){
    points = 0;
  }
}
