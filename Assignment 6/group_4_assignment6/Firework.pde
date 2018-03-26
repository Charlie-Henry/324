class dot {
  PVector loc;
  PVector speed;
  PVector acc;
  float time;

  boolean seed = false;

  float ColorOfFirework;

  dot(float x, float y, float colorFirework) {
    ColorOfFirework = colorFirework;

    acc = new PVector(0, 0);
    speed = new PVector(0, random(-12, -5));
    loc =  new PVector(x, y);
    seed = true;
    time = 400.0;
  }

  dot(PVector l, float colorFirework) {
    ColorOfFirework = colorFirework;
    acc = new PVector(0, 0);
    speed = PVector.random2D();
    speed.mult(random(4, 8));
    loc = l.copy();
    time = 255.0;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void run() {
    update();
    display();
  }

  boolean boom() {
    if (seed && speed.y > 0) {
      time = 0;
      return true;
    }
    return false;
  }

  void update() {

    speed.add(acc);
    loc.add(speed);
    if (!seed) {
      time -= 5.0;
      speed.mult(0.95);
    }
    acc.mult(0);
  }

  void display() {
    stroke(ColorOfFirework, 255, 255, time);
    if (seed) {
      strokeWeight(4);
    } else {
      strokeWeight(2);
    }
    point(loc.x, loc.y);
  }

  boolean isDoesItWork() {
    if (time < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}