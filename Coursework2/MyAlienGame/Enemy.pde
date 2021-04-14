class Enemy {
  //attributes that describe an Enemy
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;

  int bodyColor = 255; // RED

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveXBy = 2;
  int moveYBy = 1;

  // Constructors
  Enemy() {
    bodyWidth = 75;
    bodyHeight = 100;
    bodyXLoc = 200;
    bodyYLoc = 200;
  }

  Enemy(int bWidth, int bHeight, int startX, int startY) {
    bodyWidth = bWidth;
    bodyHeight = bHeight;
    bodyXLoc = startX;
    bodyYLoc = startY;
  }

  // Draws body using goniometry for antennas
  void drawBody() {    
    stroke(bodyColor);
    noFill();
    arc((bodyXLoc + (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI, PI+HALF_PI);
    arc((bodyXLoc - (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI+HALF_PI, TAU);
    stroke(0);    
    fill(bodyColor);
    ellipse(bodyXLoc + bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8);
    ellipse(bodyXLoc - bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8); 
    // Draws body
    ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
  }

  // Draws face using subfunctions
  void drawFace() {
    drawEyes();
    drawMouth();
  }

  // Draws eyes
  private void drawEyes() {
    fill(0);
    headWidth = bodyWidth / 4;  
    headHeight = bodyHeight / 3;    
    headYloc = bodyYLoc - bodyHeight/20;
    headXloc = (bodyXLoc - bodyWidth / 5);    
    ellipse(headXloc, headYloc, headWidth, headHeight);
    headXloc = (bodyXLoc + bodyWidth / 5);
    ellipse(headXloc, headYloc, headWidth, headHeight);
  } 

  // Draws mouth
  private void drawMouth() {
    fill(255, 0, 255);
    headWidth = bodyWidth / 3;  
    headHeight = bodyHeight / 10;    
    headYloc = bodyYLoc + (bodyHeight / 4);
    headXloc = bodyXLoc; 
    ellipse(headXloc, headYloc, headWidth, headHeight);
  }

  void checkForBounce() {
    // If one of the lateral edges is hit change speed and direction
    if (bodyXLoc >= (width -(bodyWidth / 2))) {
      moveXBy = (int)random(2, 4);
      moveXBy = moveXBy * -1;
    }
    if (bodyXLoc <= (0 + (bodyWidth / 2))) {
      moveXBy = (int)random(2, 4);
    }
    if (bodyYLoc >= (height -(bodyHeight / 2))) {
      moveYBy = (int)random(2, 4);      
      moveYBy = moveYBy * -1;
    }
    if (bodyYLoc <= (0 + (bodyHeight / 2))) {
      moveYBy = (int)random(2, 4);
    }
  }
}
