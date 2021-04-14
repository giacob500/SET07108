class Alien {

  //attributes that describe a Alien
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  int bodyXTrueLoc = 0;
  // Array made of 3 integers used to define a RGB color
  //random values doesn't start from 0 to exclude too dark color   
  int bodyColor[] = {(int)random(50, 255), (int)random(50, 255), (int)random(50, 255)};

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveXBy = 40;
  int moveYBy = 30;

  // Constructors
  Alien() {
    bodyWidth = 75;
    bodyHeight = 100;
    bodyXLoc = 400;
    bodyYLoc = 650;
  }

  Alien(int bWidth, int bHeight, int startX, int startY) {
    bodyWidth = bWidth;
    bodyHeight = bHeight;
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
  /*
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
   */
  /*
   // Increase locaiton value to give movement effect
   void move() {
   bodyXLoc = bodyXLoc + moveXBy;
   bodyYLoc = bodyYLoc + moveYBy;
   }
   */

  void move() {    
    if (key == CODED) {
      if (keyCode == LEFT) {
        if (moveXBy > 10) {
          moveXBy += bodyXTrueLoc * 0.005;
          bodyXLoc = bodyXLoc - moveXBy;
          bodyXTrueLoc -= 400 - bodyXLoc;
          print(moveXBy + " " + bodyXLoc + " " + bodyXTrueLoc + "\n");
        }
      } else if (keyCode == RIGHT) {
        if (moveXBy > 10) {
          moveXBy -= bodyXTrueLoc * 0.005;
          bodyXLoc = bodyXLoc + moveXBy;
          bodyXTrueLoc -= 400 - bodyXLoc;
          print(moveXBy + " " + bodyXLoc + " " + bodyXTrueLoc + "\n");
        }
        /*
        moveXBy += 0.05;
        bodyXLoc = bodyXLoc + moveXBy;
        -------------------
        moveXBy = 30;
         bodyXLoc = bodyXLoc + moveXBy;
         */
      }
      /*
      else if (keyCode == DOWN) {
       moveYBy += 0.03 * bodyYLoc;
       bodyYLoc = bodyYLoc + moveYBy;
       }else if (keyCode == UP) {
       moveYBy += 0.03 * bodyYLoc;
       bodyYLoc = bodyYLoc - moveYBy;
       }
       */
    }
  }
}
