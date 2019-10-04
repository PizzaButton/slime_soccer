class slime {
  PVector x, v;
  float r;
  boolean jump, moveLeft, moveRight;

  slime() {
    r = 60;
    x = new PVector(100, 100);
    v = new PVector(0, 0);
    jump = false;
    moveLeft = false;
    moveRight = false;
  }

  void render() {
    noStroke();
    fill(0, 255, 0);
    arc(x.x, x.y, 2*r, 2*r, PI, 2*PI);

  }

  void update() {
    v.y += g;
    
    if (moveLeft) {
      v.x += -8;
    }
    if (moveRight) {
      v.x += 8;
    }
    if (jump && x.y == height) {
      v.y = -10;
      jump = false;
    }

    x.add(v);

    if ( x.y > height) {
      x.y = height;
      v.y = 0;
    }

    v.x = 0;
  }
}
