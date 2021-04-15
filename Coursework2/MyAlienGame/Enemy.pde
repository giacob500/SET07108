class Enemy {
  //attributes that describe an Enemy
  float bodyWidth;
  float bodyHeight;
  int bodyXLoc;
  int bodyYLoc;

  int bodyColor[] = {(int)random(50, 255), (int)random(50, 255), (int)random(50, 255)};

  float headWidth;
  float headHeight;
  float headXloc;
  float headYloc;

  int moveXBy = 2;
  int moveYBy = 1;

  float scale = 1;
  float speed = 1.0025;

  // Constructors
  Enemy() {
    bodyWidth = 40;
    bodyHeight = 50;
    bodyXLoc = width / 2;
    bodyYLoc = height / 2 - height / 6;
  }

  Enemy(int bWidth, int bHeight, int startX, int startY) {
    bodyWidth = bWidth / 6;
    bodyHeight = bHeight / 6;
    bodyXLoc = startX;
    bodyYLoc = startY;
  }

  // Draws body using goniometry for antennas
  void drawBody() {    
    stroke(bodyColor[0], bodyColor[1], bodyColor[2]);
    noFill();
    arc((bodyXLoc + (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI, PI+HALF_PI);
    arc((bodyXLoc - (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI+HALF_PI, TAU);
    stroke(0);    
    fill(bodyColor[0], bodyColor[1], bodyColor[2]);
    ellipse(bodyXLoc + bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8);
    ellipse(bodyXLoc - bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8); 
    // Draws body
    ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
  }

  void getCloser() {   
    // Draws body
    stroke(bodyColor[0], bodyColor[1], bodyColor[2]);
    noFill();
    arc((bodyXLoc + (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI, PI+HALF_PI);
    arc((bodyXLoc - (bodyWidth / 2)), (bodyYLoc - bodyHeight / 4), bodyWidth/2, bodyHeight/2, PI+HALF_PI, TAU);
    stroke(0);    
    fill(bodyColor[0], bodyColor[1], bodyColor[2]);
    ellipse(bodyXLoc + bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8);
    ellipse(bodyXLoc - bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8); 
    // Draws body
    ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);    
    // Draws eyes
    fill(255, 0, 0);
    headWidth = bodyWidth / 4;
    headHeight = bodyHeight / 3;
    headYloc = bodyYLoc - bodyHeight/20;
    headXloc = (bodyXLoc - bodyWidth / 5);  
    arc(headXloc, headYloc, bodyWidth/4, bodyHeight/4, 0, PI+QUARTER_PI, CHORD);  
    //ellipse(headXloc, headYloc, headWidth, headHeight);
    headXloc = (bodyXLoc + bodyWidth / 5);
    arc(headXloc, headYloc, bodyWidth/4, bodyHeight/4, 0-QUARTER_PI, PI, CHORD);
    //ellipse(headXloc, headYloc, headWidth, headHeight);
    // Draws mouth
    fill(255, 0, 255);
    headWidth = bodyWidth / 3;  
    headHeight = bodyHeight / 10;    
    headYloc = bodyYLoc + (bodyHeight / 4);
    headXloc = bodyXLoc; 
    ellipse(headXloc, headYloc, headWidth, headHeight);
    
    // Increase variables
    if (bodyWidth < width/7 || bodyHeight < height/7) {
      bodyWidth*=speed;
      bodyHeight*=speed;
    }
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
  void move() {   
    getCloser();
    // Increase locaiton value to give movement effect
  }
}
