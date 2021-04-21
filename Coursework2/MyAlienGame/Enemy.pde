class Enemy {
  //attributes that describe an Enemy

  float bodyWidth;
  float bodyHeight;
  int bodyXLoc;
  float bodyYLoc;
  float bodyWidthCopy;
  float bodyHeightCopy;
  int bodyXLocCopy;
  float bodyYLocCopy;

  color bodyColor = color(random(50, 255), random(50, 255), random(50, 255));

  float headWidth;
  float headHeight;
  float headXloc;
  float headYloc;

  boolean show = true;

  float moveXBy = random(1, 1.05);
  int negativeOrPositive = (int)random(1, 2);
  float speed = 1.005;

  PImage explosion;

  // Constructors  
  Enemy() {
    this.bodyWidth = 40;
    this.bodyHeight = 50;
    this.bodyXLoc = width / 2;
    this.bodyYLoc = height / 2 - height / 6;
    this.bodyWidthCopy = bodyWidth;
    this.bodyHeightCopy = bodyHeight;
    this.bodyXLocCopy = bodyXLoc;
    this.bodyYLocCopy = bodyYLoc;
    explosion = loadImage("./images/enemy-explodes.png");
  }

  Enemy(int bWidth, int bHeight, int startX, int startY) {
    this.bodyWidth = bWidth / 6;
    this.bodyHeight = bHeight / 6;
    this.bodyXLoc = startX;
    this.bodyYLoc = startY;
    this.bodyWidthCopy = bodyWidth;
    this.bodyHeightCopy = bodyHeight;
    this.bodyXLocCopy = bodyXLoc;
    this.bodyYLocCopy = bodyYLoc;
    this.explosion = loadImage("./images/enemy-explodes.png");
  }

  // Draws body using goniometry for antennas
  void drawBody() {
    if (show == true && bodyYLoc < height) {
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
    } else if (bodyYLoc >= height) {
      reset();
    }
  }

  // Draws face using subfunctions
  void drawFace() {
    if (show == true) {
      drawEyes();
      drawMouth();
    }
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

  void collision() {
    //if(show == true)
    image(explosion, bodyXLoc - bodyWidth / 2, bodyXLoc - bodyHeight / 2, bodyXLoc + bodyWidth / 2, bodyXLoc + bodyHeight / 2);
    show = false;
  }

  void reset() {
    bodyWidth = bodyWidthCopy;
    bodyHeight = bodyHeightCopy;
    bodyXLoc = bodyXLocCopy;
    bodyYLoc = bodyYLocCopy;
    show = true;
  }

  void move(int alienBodyWidth, int alienBodyHeight) {
    /*
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
     */
    drawBody();
    drawFace();

    // Increase variables
    if (bodyWidth < alienBodyWidth || bodyHeight < alienBodyHeight) {
      bodyWidth*=speed*speed;
      bodyHeight*=speed*speed;
    }

    // Increase locaiton value to give movement effect
    bodyYLoc*=speed;
  }
}
