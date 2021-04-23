class Alien {

  //attributes that describe a Alien
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  int bodyWidthCopy;
  int bodyHeightCopy;
  int bodyXLocCopy;
  int bodyYLocCopy;
  int bodyColor = color(random(50, 255), random(50, 255), random(50, 255));

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveXBy = 40;
  int moveYBy = 30;

  //boolean showAlien = true;

  PImage spaceship1;
  //PImage explosion;

  // Constructors
  Alien() {
    this.bodyWidth = 75;
    this.bodyHeight = 100;
    this.bodyXLoc = 400;
    this.bodyYLoc = 690;
    this.bodyWidthCopy = bodyWidth;
    this.bodyHeightCopy = bodyHeight;
    this.bodyXLocCopy = bodyXLoc;
    this.bodyYLoc = bodyYLocCopy;
    //this.bodyYLoc = 650;loadImage("./images/enemy-explodes.png");
  }

  Alien(int bWidth, int bHeight, int startX, int startY) {
    this.bodyWidth = bWidth;
    this.bodyHeight = bHeight;
    this.bodyXLoc = startX;
    this.bodyYLoc = startY;    
    this.bodyWidthCopy = bodyWidth;
    this.bodyHeightCopy = bodyHeight;
    this.bodyXLocCopy = bodyXLoc;
    this.bodyYLocCopy = bodyYLoc;
    //explosion = loadImage("./images/enemy-explodes.png");
  }  

  // Draws body using goniometry for antennas
  void drawBody() {
    //if (showAlien == true) {
      //spawnSpaceship();
      strokeWeight(1);
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
      drawFace();
    //}
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
  
  void spawnSpaceship() {
    spaceship1 = loadImage("./images/spaceship_1_centered.png");
    //image(img, width / 2 - 244, bodyYLoc - bodyHeight / 2);
    imageMode(CENTER);
    image(spaceship1, bodyXLoc, bodyYLoc, bodyWidth*2.5, bodyHeight*2);
  }

  void collision() {
    //showAlien = false;
  }

  void resetAlien() {
    bodyWidth = bodyWidthCopy;
    bodyHeight = bodyHeightCopy;
    bodyXLoc = bodyXLocCopy;
    bodyYLoc = bodyYLocCopy;
    //showAlien = true;
  }

  void move(String controls) {
    if (controls == "keyboard") {
      if (key == CODED) {
        if (keyCode == LEFT) {
          if (bodyXLoc > bodyWidth/2)
            bodyXLoc = bodyXLoc - moveXBy;
        } else if (keyCode == RIGHT) {
          if (bodyXLoc < width - bodyWidth/2)          
            bodyXLoc = bodyXLoc + moveXBy;
        } else if (keyCode == UP) {
          if (bodyYLoc > height/2 + bodyHeight/2)        
            bodyYLoc = bodyYLoc - moveXBy;
        } else if (keyCode == DOWN) {
          if (bodyYLoc < height - bodyHeight)       
            bodyYLoc = bodyYLoc + moveXBy;
        }
      }
    } else if (controls == "mouse") {
      bodyXLoc = mouseX;
      if (mouseY > height/2 + bodyHeight) {
        bodyYLoc = mouseY;
      } else {
        bodyYLoc = height/2 + bodyHeight;
      }
      /*
      if(mousePressed){
       bodyXLoc = mouseX;
       bodyYLoc = mouseY;
       }
       */
    }
  }
}
