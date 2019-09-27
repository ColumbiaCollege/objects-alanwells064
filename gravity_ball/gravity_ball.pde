Mainball main = new Mainball();
ArrayList<Ball> balls = new ArrayList<Ball>();
//set canvas size, text size, & color mode
void setup() {
  size(800, 800);
  textSize(20);
  colorMode(HSB);
}
void draw() {
  //draw background every frame
  background(#88DE7D);
  main.move();
  main.collide();
  main.display();
  for (Ball ball : balls) {
    ball.move();
    ball.collide();
    ball.display();
  }
}
//hit the ball in the whatever direction is pressed (MUST CLICK INTO THE WINDOW)
void keyPressed() {
  println(key);
  if (key=='w')
  {
    main.w();
  }
  if (key=='s') {
    main.s();
  }
  if (key=='a') {
    main.a();
  }
  if (key=='d') {
    main.d();
  }
}


void mouseClicked() {
  balls.add(new Ball());
}
