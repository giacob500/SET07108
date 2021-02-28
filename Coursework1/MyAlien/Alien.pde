class Alien {
  
  //attributes that describe a Alien
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveBy = 2;
  
  Alien() {
    bodyWidth = 75;
    bodyHeight = 100;
    bodyXLoc = 200;
    bodyYLoc = 200;
    
  }//end constructor  
  
  Alien(int bWidth, int bHeight, int startX, int startY) {
    bodyWidth = bWidth;
    bodyHeight = bHeight;
    bodyXLoc = startX;
    bodyYLoc = startY;
  }  
  
 void drawBody() {
  ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
  }
  
  void drawHead() {
    headWidth = bodyWidth / 2;    
    headHeight = bodyHeight / 2;
    headXloc = bodyXLoc;
    headYloc = (bodyYLoc - (bodyHeight /2) - (headHeight / 2));
    ellipse(headXloc, headYloc, headWidth, headHeight);
  }   
  
  void checkForBounce() {
    if(bodyXLoc >= (width -(bodyWidth / 2))) {
      moveBy = moveBy * -1;
    }
    if(bodyXLoc <= (0 + (bodyWidth / 2))) {
      moveBy = moveBy * -1;
    } 
  } 
  
  void move() {
    bodyXLoc = bodyXLoc + moveBy; 
  } 
  
}//end class Alien  
