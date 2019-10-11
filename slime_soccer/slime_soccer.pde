float g = 0.44;
int score1, score2;
ball b;
slime s;
int time;
int framerate;
boolean exit;

void setup() {
  size(1200, 600);
  b = new ball();
  s = new slime();
  score1 = 0;
  score2 = 0;
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
  text(score1 + " - " + score2, 600, 50);

  //tid-tæller
  text(time, 1100, 50);
  if (time >= 1) {
    if (frameCount % 60 == 59) {
      time = time - 1;
    }
  }

  //stolper - v
  fill(0);
  rect(5, 470, 10, 130);
  rect(5, 470, 100, 10);

  //stolper - h
  rect(1180, 470, 10, 130);
  rect(1080, 470, 100, 10);

  //vertikale linjer - v
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

  //vertikale linjer - h
  strokeWeight(2);
  line(1087, 475, 1087, 600);
  strokeWeight(1);
  line(1175, 475, 1175, 600);
  line(1165, 475, 1165, 600);
  line(1155, 475, 1155, 600);
  line(1145, 475, 1145, 600);
  line(1135, 475, 1135, 600);
  line(1125, 475, 1125, 600);
  line(1115, 475, 1115, 600);
  line(1105, 475, 1105, 600);
  line(1095, 475, 1095, 600);

  //horisontale linjer - v
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

  //horisontale linjer - h
  line(1087, 490, 1187, 490);
  line(1087, 500, 1187, 500);
  line(1087, 510, 1187, 510);
  line(1087, 520, 1187, 520);
  line(1087, 530, 1187, 530);
  line(1087, 540, 1187, 540);
  line(1087, 550, 1187, 550);
  line(1087, 560, 1187, 560);
  line(1087, 570, 1187, 570);
  line(1087, 580, 1187, 580);
  line(1087, 590, 1187, 590);

  //plusser én til scoren hver gang bolden rammer venstre mål
  if (b.x.x < 98) {
    if (b.x.y > 480) {
      score2 = score2 + 1;
    }
  }

  //plusser én til scoren hver gang bolden rammer højre mål
  if (b.x.x > 1087) {
    if (b.x.y > 480) {
      score1 = score1 + 1;
    }
  }

  //teleporterer bolden til midten af banen hver gang der scores i venstre mål
  if (b.x.x < 98) {
    if (b.x.y > 480) {
      b.x.x = 600;
      b.x.y = 300;
      b.v.x = 0;
      b.v.y = 0;
    }
  } 

  //teleporterer bolden til midten af banen hver gang der scores
  if (b.x.x > 1087) {
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

  //Stopper spillet ved 0 sekubnder, og viser scorer og fremhæver vinder af kampen
  if (time == 0) {
    framerate = 0;
    noStroke();
    fill(150, 50);
    rect(0, 200, 1200, 200);
    fill(255);
    textSize(100);
    text("SCORE:" + score1 + " - " + score2, 300, 350);
    if (score1 > score2) {
    fill(0);
    textSize(50);
    text("Venstre spiller vinder!", 350, 500);
    } if (score1 < score2) {
    fill(0);
    textSize(50);
    text("Højre spiller vinder!", 350, 500);
    } if (score1 == score2) {
    fill(0);
    textSize(50);
    text("Uafgjort", 470, 500);
    }
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
