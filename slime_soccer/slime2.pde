class slime2 {
  PVector x2, v2;
  float r;
  float eyesize;
  boolean jump, moveLeft, moveRight;

  slime2() {
    r = 60;
    x2 = new PVector(1100, 100);
    v2 = new PVector(0, 0);
    jump = false;
    moveLeft = false;
    moveRight = false;

    eyesize = 16;
  }

  void render() {
    noStroke();
    fill(155, 0, 255);
    arc(x2.x, x2.y, 2*r, 2*r, PI, 2*PI);

    // Eyes:
    fill(245);
    ellipse(x2.x-r/1.8, x2.y-r/1.6, eyesize*2, eyesize*2);    
    fill(20);
    ellipse(x2.x-r/1.8, x2.y-r/1.6, eyesize, eyesize);
  }

  void update() {
    v2.y += g;

    if (moveLeft) {
      v2.x += -8;
    }
    if (moveRight) {
      v2.x += 8;
    }
    if (jump && x2.y == height) {
      v2.y = -10;
      jump = false;
    }

    x2.add(v2);

    if (x2.y > height) {
      x2.y = height;
      v2.y = 0;
    }

    v2.x = 0;
    if (x2.x + r > width) {
      x2.x = width - r;
      v2.x = -v2.x;
    } 
    if (x2.x - r < 0) {
      x2.x = 0 + r;
      v2.x = -v2.x;
    }

  }
}
