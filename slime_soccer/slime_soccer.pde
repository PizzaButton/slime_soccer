float g = 0.44;
int score;
ball b;
slime s;
int time;
int framerate;
boolean exit;

void setup() {
  size(1200, 600);
  b = new ball();
  s = new slime();
  score = 0;
  time = 120;
  framerate = 60;
  exit = false;
}

void draw() {
  background(255);
  frameRate(framerate);

  //pointtæller
  textSize(32);
  textMode(CENTER);
  text("score:", 500, 50);
  text(score, 600, 50);

  //tid-tæller
  text(time, 1100, 50);
  if (time >= 1) {
    if (frameCount % 60 == 59) {
      time = time - 1;
    }
  }

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

  //plusser én til scoren hver gang bolden rammer målet
  if (b.x.x < 130) {
    if (b.x.y > 480) {
      score = score + 1;
    }
  }

  //teleporterer bolden til midten af banen hver gang der scores
  if (b.x.x < 130) {
    if (b.x.y > 480) {
      b.x.x = 600;
      b.x.y = 300;
      b.v.x = 0;
      b.v.y = 0;
    }
  } 



  s.render();
  b.render();

  s.update();
  b.update();

  if (time == 0) {
    framerate = 0;
    noStroke();
    fill(150, 50);
    rect(0, 200, 1200, 200);
    fill(255);
    textSize(100);
    text("SCORE:" + score, 400, 350);
  }
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
