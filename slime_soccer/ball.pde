class ball {
  PVector x, v;
  float r;

  ball() {
    x = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    r = 20;
  }

  void render() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x.x, x.y, 2*r, 2*r);
  }

  void update() {
    if (dist(x.x, x.y, s.x.x, s.x.y) < r + s.r) {
      bounce(s);
    } else {
      v.mult(0.99);
      v.y += g - 0.14;
    }
    if (dist(x.x, x.y, s2.x2.x, s2.x2.y) < r + s2.r) {
      bounce(s2);
    } else {
      v.mult(0.99);
      v.y += g - 0.14;
    } 

    if (x.y == 0) {
      v.mult(0.7);
    }

    v.limit(20);
    x.add(v);

    //bold hopper på gulv
    if (x.y + r > height) {
      x.y = height - r;
      v.y = -v.y;
    } 
    //bold hopper på højre kant
    if (x.x + r > width) {
      x.x = width - r;
      v.x = -v.x;
    } 
    //bold hopper på venstre kant
    if (x.x - r < 0) {
      x.x = 0 + r;
      v.x = -v.x;
    }

    //bold hopper på venstre mål
    if (x.x < 100 && 485 > x.y) {
      if (x.y > 475) {
        x.y = x.y - 5;
        v.y = -v.y;
      }
    }
    
    //bold hopper på højre mål
    if (x.x > 1087 && 485 > x.y) {
      if (x.y > 475) {
        x.y = x.y - 5;
        v.y = -v.y;
      }
    }
  }

  void bounce(slime s) {
    PVector n = PVector.sub(x, s.x);
    float distanceCor = r + s.r - n.mag();
    n.normalize();
    v.sub(PVector.mult(n, 2*PVector.dot(n, v)));
    x.add(n.setMag(distanceCor));
    x.add(s.v);
    v.mult(1.5);
  }
  void bounce(slime2 s2) {
    PVector n = PVector.sub(x, s2.x2);
    float distanceCor = r + s2.r - n.mag();
    n.normalize();
    v.sub(PVector.mult(n, 2*PVector.dot(n, v)));
    x.add(n.setMag(distanceCor));
    x.add(s2.v2);
    v.mult(1.5);
  }
}
