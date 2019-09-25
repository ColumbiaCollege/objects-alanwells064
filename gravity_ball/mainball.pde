class mainball {
  //properties
  float xpos;
  int ypos;
  float xaccel = 200;
  int yaccel = 0;
  //define speed variable
  float speed = 0;
  //define number of collisions variable
  int collisions = 0;
  //define color variable
  int c = 0;
  //constructor
  mainball() {
    xpos = 100;
    ypos = 100;
  }
  //methods
  void display() {
    fill(c, 255, 255);
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
      xaccel = xaccel*(-1);
      xpos = 775;
      collisions++;
      c = int(random(0, 256));
    }
    if (xpos<25) {
      xaccel = xaccel*(-1);
      xpos = 25;
      collisions++;
      c = int(random(0, 256));
    }
    if (abs(xaccel)<0.1) {
      xaccel = 0;
    }
    if (ypos>775) {
      yaccel = yaccel*(-1)+3;
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