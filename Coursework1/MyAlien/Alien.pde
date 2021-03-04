class Alien {

  //attributes that describe a Alien
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  int bodyColor[] = {(int)random(75, 255), (int)random(75, 255), (int)random(75, 255)};

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveXBy = 2;
  int moveYBy = 1;
  

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
    stroke(bodyColor[0], bodyColor[1], bodyColor[2]);
    line(bodyXLoc, bodyYLoc, (bodyXLoc + (bodyWidth / 2)), (bodyYLoc - bodyHeight / 2));
    line(bodyXLoc, bodyYLoc, (bodyXLoc - (bodyWidth / 2)), (bodyYLoc - bodyHeight / 2));
    stroke(0);
    println(bodyColor[0]+ " "+ bodyColor[1] + " "+ bodyColor[2]);
    fill(bodyColor[0], bodyColor[1], bodyColor[2]);
    ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
    ellipse(bodyXLoc + bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8);
    ellipse(bodyXLoc - bodyWidth / 2, bodyYLoc - bodyHeight / 2, bodyWidth/8, bodyHeight/8); 
}

  void drawFace() {   
    drawEyes();
    drawMouth();
  }

  void drawEyes() {
    fill(0);
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
    headYloc = bodyYLoc + (bodyHeight / 4);
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
    bodyXLoc = bodyXLoc + moveXBy;
    bodyYLoc = bodyYLoc + moveYBy;
    //bodyXLoc = bodyXLoc + random(0, 255);
    //bodyYLoc = bodyYLoc + random(0, 255);
  }
}

//end class Alien  
