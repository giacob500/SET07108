class Button {
  PVector pos = new PVector(0, 0);
  float buttonWidth = 0;
  float buttonHeight = 0;
  color colour;
  String text;
  Boolean pressed = false;
  Boolean clicked = false;
  // Constructor to create a button
  Button(int x, int y, int w, int h, String t, int r, int g, int b) {
    pos.x = x;
    pos.y = y;
    buttonWidth = w;
    buttonHeight = h;
    colour = color(r, g, b);
    text = t;
  }

  void update() {
    if (mousePressed == true && mouseButton == LEFT && pressed == false) {
      pressed = true;
      if (mouseX >= pos.x && mouseX <= pos.x+buttonWidth && mouseY >= pos.y && mouseY <= pos.y + buttonHeight) {
        clicked = true;
      }
    } else {
      clicked = false;
    }
    
    if(mousePressed != true){
      pressed = false;
    }
  }

  // To render button to the screen
  void render() {
    fill(colour);
    rect(pos.x, pos.y, buttonWidth, buttonHeight); 

    fill(0);
    textAlign(CENTER, CENTER);
    text(text, pos.x + (buttonWidth / 2), pos.y + (buttonHeight / 2));
  }
  boolean isClicked() {
    return clicked;
  }
}
