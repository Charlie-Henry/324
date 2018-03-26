Car car1;
PShape theCar;

void settings() {
  size(500, 500);
}

void setup() {
  car1 = new Car(30,450,1,0,0,0,10, 250, .2, .2,0);
}

void draw() {
  background(200);
  car1.applyForces(3, 0);
  car1.locCar();
  car1.spring();
}