class Car {
  float x, y, vx, vy, ax, ay, m, rx, ks, kd, counter;
  
  Car (float x, float y, float vx, float vy, float ax, float ay, float m, float rx, float ks, float kd, int counter) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.m = m;
    this.rx = rx;
    this.ks = ks;
    this.kd = kd;
    this.counter = counter;
  }
  
  void locCar() {
    PShape theCar = createShape(GROUP);
    PShape body = createShape(RECT, x - 10, y - 55, 120, 40);
    PShape wheel1 = createShape(ELLIPSE, x, y, 30, 30);
    PShape wheel2 = createShape(ELLIPSE, x + 100, y, 30, 30);
    PShape window1 = createShape(RECT, x + 25, y - 50, 22, 18);
    PShape window2 = createShape(RECT, x + 55, y - 50, 22, 18);
    PShape taxi = createShape();
    taxi.beginShape();
    taxi.vertex(x + 20, y - 55);
    taxi.vertex(x + 30, y - 80);
    taxi.vertex(x + 70, y - 80);
    taxi.vertex(x + 80, y - 55);
    taxi.endShape();
    theCar.addChild(body);
    theCar.addChild(wheel1);
    theCar.addChild(wheel2);
    theCar.addChild(window1);
    theCar.addChild(window2);
    theCar.addChild(taxi);
    shape(theCar);
    textSize(20);
    fill(0);
    text("Taxi", x + 28, y - 56);
    fill(255, 255, 0);
    
    if (counter > 40) {
      car1 = new Car(30,450,1,0,0,0,10, 250, .2, .2,0);
    }
  }
  
  void applyForces(float fx, float fy){
    ax = fx/m;
    ay = fy/m;
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
  }
  
  void spring() {
    if (x >= 390) {
      float f = -((ks * (x - rx)) + kd * vx);
      ax = f/m;
      vx = vx + ax;
      x += vx;
      counter++;
    }
  }
}