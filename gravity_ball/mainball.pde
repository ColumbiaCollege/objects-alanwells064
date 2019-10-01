class Mainball {
  //properties
  float xpos;
  float ypos;
  float xaccel = 200;
  float yaccel = 0;
  //define speed variable
  float speed = 0;
  //define number of collisions variable
  int collisions = 0;
  //define color variable
  int c = 0;
  //variables for switching velocities when balls collide
  float tempx;
  float tempy;
  //constructor, initializes ball where mouse is clicked
  Mainball() {
    xpos = 100;
    ypos = 100;
  }
  //methods
  //display ball at current location
  void display() {
    fill(c, 255, 255);
    ellipse(xpos, ypos, 50, 50);
  }
  //change position by adding acceleration
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
      collisions++;
      c = int(random(0, 256));
    }
    if (xpos<25) {
      xaccel = xaccel*(-1)-1;
      xpos = 25;
      collisions++;
      c = int(random(0, 256));
    }
    if (abs(xaccel)<0.1) {
      xaccel = 0;
    }
    if (ypos>775) {
      yaccel = yaccel*(-1)+5;
      ypos = 775;
      if (yaccel<1) {
        collisions++;
        c = int(random(0, 256));
      }
    }
    if (ypos<25) {
      yaccel = yaccel*(-1)-1;
      ypos = 27;
      collisions++;
      c = int(random(0, 256));
    }
    //for every ball
    for (Ball ball : balls) {
      //check if balls are colliding
      if (dist(ball.xpos, ball.ypos, xpos, ypos)<50) {
        //switch the x acceleration between the two colliding balls
        tempx = ball.xaccel;
        ball.xaccel = xaccel;
        xaccel = tempx;
        //switch the y acceleration between the two colliding balls
        tempy = ball.yaccel;
        ball.yaccel = yaccel;
        yaccel = tempy;
        //add a bit of additional acceleration based on how much the balls are overlapping/colliding
        xaccel = xaccel + 0.1*(xpos-ball.xpos);
        ball.xaccel = ball.xaccel + 0.1*(ball.xpos-xpos);
        yaccel = yaccel + 0.1*(ypos-ball.ypos);
        ball.yaccel = ball.yaccel + 0.1*(ball.ypos-ypos);
      }
    }
  }
  void w() {
    yaccel = yaccel-40;
  }
  void s() {
    yaccel = yaccel+40;
  }
  void a() {
    xaccel = xaccel-40;
  }
  void d() {
    xaccel = xaccel+40;
  }
}
