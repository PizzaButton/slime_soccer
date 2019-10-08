float g = 0.44;
int score;
ball b;
slime s;

void setup() {
  size(1200, 600);
  b = new ball();
  s = new slime();
  score = 0;
}

void draw() {
  background(255);

  s.render();
  b.render();

  s.update();
  b.update();
  
    
}

void keyPressed() {
  if (key == 'w') {
    s.jump = true;
  }
  if (key == 'a') {
    s.moveLeft = true;
  }
  if (key == 'd') {
    s.moveRight = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    s.moveLeft = false;
  }
  if (key == 'd') {
    s.moveRight = false;
  }
}
