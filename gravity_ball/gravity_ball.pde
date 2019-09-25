mainball main = new mainball();
ArrayList<ball> balls = new ArrayList<ball>();
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


void mouseClicked(){
  balls.add(new ball());
}
