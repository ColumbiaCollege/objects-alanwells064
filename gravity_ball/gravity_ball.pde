//creates a new mainball called main (controllable)
Mainball main = new Mainball();
//intialize arraylist called balls based on Ball
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
  //mainball move, collide, & display
  main.move();
  main.collide();
  main.display();
  //move, collide, & display every ball (based on Ball) in the arraylist balls
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
//adds a new ball object (based on Ball) to the array list called balls
void mouseClicked() {
  balls.add(new Ball());
}
