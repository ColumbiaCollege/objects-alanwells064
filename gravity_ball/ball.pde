class Ball {
  //properties
  float xpos;
  float ypos;
  float xaccel = 0;
  float yaccel = -10;
  //variables for switching variables when balls collide
  float tempx;
  float tempy;
  //constructor
  Ball() {
    xpos = mouseX;
    ypos = mouseY;
  }
  //methods
  void display() {
    fill(255);
    ellipse(xpos, ypos, 50, 50);
  }
  void move() {
    xpos = xpos+xaccel;
    ypos = ypos+yaccel;
    //decrease horizontal acceleration
    xaccel = xaccel*0.98;
    //increase vertical acceleration (gravity)
    yaccel++;
  }
  void collide() {
    //test for and apply wall collisions by inverting acceleration and changing random ball color
    if (xpos>775) {
      xaccel = xaccel*(-1)+1;
      xpos = 775;
    }
    if (xpos<25) {
      xaccel = xaccel*(-1)-1;
      xpos = 25;
    }
    if (abs(xaccel)<0.1) {
      xaccel = 0;
    }
    if (ypos>775) {
      yaccel = yaccel*(-1)+5;
      ypos = 775;
      if (yaccel<1) {
      }
    }
    if (ypos<25) {
      yaccel = yaccel*(-1)-1;
      ypos = 27;
    }
    for (Ball ball : balls) {
      if (dist(ball.xpos, ball.ypos, xpos, ypos)<50) {
        tempx = ball.xaccel;
        ball.xaccel = xaccel;
        xaccel = tempx;
        tempy = ball.yaccel;
        ball.yaccel = yaccel;
        yaccel = tempy;
        xaccel = xaccel + 0.1*(xpos-ball.xpos);
        ball.xaccel = ball.xaccel + 0.1*(ball.xpos-xpos);
        yaccel = yaccel + 0.1*(ypos-ball.ypos);
        ball.yaccel = ball.yaccel + 0.1*(ball.ypos-ypos);
      }
    }
  }
}
