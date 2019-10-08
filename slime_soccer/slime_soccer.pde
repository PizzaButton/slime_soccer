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
  
  textSize(32);
  textMode(CENTER);
  text("score:", 500, 50);
  text(score, 600, 50);
  
  //stolper
  fill(0);
  rect(5, 470, 10, 130);
  rect(5, 470, 100, 10);
  
  //vertikale linjer
  stroke(0);
  strokeWeight(2);
  line(98, 475, 98, 600);
  strokeWeight(1);
  line(20, 475, 20, 600);
  line(30, 475, 30, 600);
  line(40, 475, 40, 600);
  line(50, 475, 50, 600);
  line(60, 475, 60, 600);
  line(70, 475, 70, 600);
  line(80, 475, 80, 600);
  line(90, 475, 90, 600);
  
  //horisontale linjer
  line(10, 490, 98, 490);
  line(10, 500, 98, 500);
  line(10, 510, 98, 510);
  line(10, 520, 98, 520);
  line(10, 530, 98, 530);
  line(10, 540, 98, 540);
  line(10, 550, 98, 550);
  line(10, 560, 98, 560);
  line(10, 570, 98, 570);
  line(10, 580, 98, 580);
  line(10, 590, 98, 590);
  
  
  
  

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
