class Alien {

  //attributes that describe a Alien
  int bodyWidth;
  int bodyHeight;
  int bodyXLoc;
  int bodyYLoc;
  int bodyXTrueLoc = 0;
  // Array made of 3 integers used to define a RGB color
  //random values doesn't start from 0 to exclude too dark color   
  int bodyColor = color(random(50, 255), random(50, 255), random(50, 255));

  int headWidth;
  int headHeight;
  int headXloc;
  int headYloc;

  int moveXBy = 40;
  int moveYBy = 30;

  PImage explosion;

  // Constructors
  Alien() {
    this.bodyWidth = 75;
    this.bodyHeight = 100;
    this.bodyXLoc = 400;
    this.bodyYLoc = 650;loadImage("./images/enemy-explodes.png");
  }

  Alien(int bWidth, int bHeight, int startX, int startY) {
    this.bodyWidth = bWidth;
    this.bodyHeight = bHeight;
    this.bodyXLoc = startX;
    this.bodyYLoc = startY;
    explosion = loadImage("./images/enemy-explodes.png");    
  }  

  // Draws body using goniometry for antennas
  void drawBody() {
    spawnSpaceship();
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

  void spawnSpaceship() {
    img = loadImage("./images/spaceship_1_centered.png");
    //image(img, width / 2 - 244, bodyYLoc - bodyHeight / 2);
    imageMode(CENTER);
    image(img, bodyXLoc, bodyYLoc, bodyHeight*2, bodyWidth*2.5);
  }
  
  void collision(){
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
      noCursor();
      bodyXLoc = mouseX;
      if (mouseY > height/2) {
        bodyYLoc = mouseY;
      } else {
        bodyYLoc = height/2;
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
