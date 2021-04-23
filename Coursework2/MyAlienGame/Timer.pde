class Timer {
  float time;
  float timeCopy;
  int size;
  int positionX;
  int positionY;

  // Constructors
  Timer() {
    this.time = 0;
    this.positionX = width / 2;
    this.positionY = 45;
    this.size= 35;
    this.timeCopy = time;
  }  

  Timer(float set, int positionX, int positionY, int size) {
    this.time = set;
    this.positionX = positionX;
    this.positionY = positionY;
    this.size= size;
    this.timeCopy = time;
  }

  // Returns current time
  float getTime() {
    return time;
  }

  // Set the timer to whatever is put
  void setTime(float set) {
    time = set;
  }

  // Update the timer by counting up
  void countUp() {
    time += 1 / frameRate;
  }

  // Update the timer by counting down
  void countDown() {
    if (time >= 0.01)
      time -= 1 / frameRate;
  }

  void resetTimer() {
    time = timeCopy;
  }

  void show() {
    textAlign(CENTER);
    textSize(35);
    if (time > 10) {
      fill(255, 255, 0);
    } else {
      if ((int)time % 2 != 0)
        fill(255, 255, 0);
      else
        fill(255, 0, 0);
    }
    text("Time left:\n" + nf(time, 0, 2) + "s", positionX, positionY);
  }
}
