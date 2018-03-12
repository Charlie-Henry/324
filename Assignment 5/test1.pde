Dog doge;

void setup() {
  size(500, 500, P3D);
  doge = new Dog(20, 10, 10);
  camera(0, 0, 100, 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(255);
  doge.moveDog();
  doge.moveDogHead();
  doge.moveDogLeg1();
  doge.moveDogLeg2();
}