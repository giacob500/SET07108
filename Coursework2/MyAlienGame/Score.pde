class Score {
  int points;
  int size;
  int positionX;
  int positionY;  

  // Constructors
  Score () {
    this.points = 0;
    this.positionX = width - 175;
    this.positionY = 45;
    this.size= 35;
  }

  Score (int points, int positionX, int positionY, int size) {
    this.points = points;    
    this.positionX = positionX;
    this.positionY = positionY;
    this.size= size;
  }
  
  int getScore(){
  return points;
  }

  void show() {
    textAlign(CORNER, CORNER);
    textSize(size);
    fill(255, 255, 0);
    text("Score: " + points, positionX, positionY); 
  }
  
  //boolean value
  void increaseScore(){
    //if(value == true)
    points++;
  }
  
  void resetScore(){
    points = 0;
  }
}
