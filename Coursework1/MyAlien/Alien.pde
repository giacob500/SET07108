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
    stroke(0, 255, 0);
    line(bodyXLoc, bodyYLoc, (bodyXLoc + (bodyWidth / 2)), ((bodyYLoc / 2) + (bodyHeight/5)));
        line(bodyXLoc, bodyYLoc, (bodyXLoc - (bodyWidth / 2)), ((bodyYLoc / 2) + (bodyHeight/5)));
    fill(0, 255, 0);
    stroke(0);
    ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
  }

  void drawFace() {   
    drawEyes();
    drawMouth();
  }

  void drawEyes() {
    fill(255);
    headWidth = bodyWidth / 4;  
    headHeight = bodyHeight / 3;    
    headYloc = bodyYLoc - bodyHeight/20;
    headXloc = (bodyXLoc - bodyWidth / 5);    
    ellipse(headXloc, headYloc, headWidth, headHeight);
    headXloc = (bodyXLoc + bodyWidth / 5);
    ellipse(headXloc, headYloc, headWidth, headHeight);
  } 

  void drawMouth() {
    fill(255,0,255);
    headWidth = bodyWidth / 3;  
    headHeight = bodyHeight / 10;    
    headYloc = bodyYLoc + (bodyWidth / 3);
    headXloc = bodyXLoc; 
    ellipse(headXloc, headYloc, headWidth, headHeight);
    
    /* To draw curves:
    noFill();
    stroke(255, 102, 0);
    curve(5, 26, 5, 26, 73, 24, 73, 61);
    stroke(0); 
    curve(5, 26, 73, 24, 73, 61, 15, 65); 
    stroke(255, 102, 0);
    curve(73, 24, 73, 61, 15, 65, 15, 65);*/
  } 

  void checkForBounce() {
    if (bodyXLoc >= (width -(bodyWidth / 2))) {
      moveBy = moveBy * -1;
    }
    if (bodyXLoc <= (0 + (bodyWidth / 2))) {
      moveBy = moveBy * -1;
    }
  } 

  void move() {
    bodyXLoc = bodyXLoc + moveBy;
  }
}

//end class Alien  
