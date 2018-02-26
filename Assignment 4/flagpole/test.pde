Bird bird1;
Bird bird2;
Wing wing1;
Wing wing2;
PShape aBird1;
PShape aBird2;
PShape aWings1;
PShape aWings2;

void settings() {
  size(1000, 800);
}

void setup() {
  frameRate(5);
  PVector p1 = new PVector(25, 0);
  PVector p2 = new PVector(50, 0);
  

  aBird1 = createShape(GROUP);
  PShape body1 = createShape(RECT, 50, 50, 70, 40);
  PShape head1 = createShape(TRIANGLE, 50 + 70, 50, 50 + 70, 50 + 40, 50 + 100, 50 + 20);
  aBird1.addChild(body1);
  aBird1.addChild(head1);
  bird1 = new Bird(aBird1, 50, 50, p1);
  
  
  aWings1 = createShape(GROUP);
  PShape wingOne1 = createShape(TRIANGLE, bird1.x, bird1.y + 40, bird1.x + 70, bird1.y + 40, bird1.x + 35, bird1.y + 65);
  PShape wingTwo1 = createShape(TRIANGLE, bird1.x, bird1.y, bird1.x + 70, bird1.y, bird1.x + 35, bird1.y - 25);
  aWings1.addChild(wingOne1);
  aWings1.addChild(wingTwo1);
  wing1 = new Wing(wingOne1, wingTwo1, 50, 50, p1, 70);
  
  
  
  aBird2 = createShape(GROUP);
  PShape body2 = createShape(RECT, 50, 200, 70, 40);
  PShape head2 = createShape(TRIANGLE, 50 + 70, 200, 50 + 70, 200 + 40, 50 + 100, 200 + 20);
  aBird2.addChild(body2);
  aBird2.addChild(head2);
  bird2 = new Bird(aBird2, 50, 200, p2);
  

  aWings2 = createShape(GROUP);
  PShape wingOne2 = createShape(TRIANGLE, bird2.x, bird2.y + 40, bird2.x + 70, bird2.y + 40, bird2.x + 35, bird2.y + 65);
  PShape wingTwo2 = createShape(TRIANGLE, bird2.x, bird2.y, bird2.x + 70, bird2.y, bird2.x + 35, bird2.y - 25);
  aWings2.addChild(wingOne2);
  aWings2.addChild(wingTwo2);
  wing2 = new Wing(wingOne2, wingTwo2, 50, 200, p2, 220);
  
}

void draw() {
  background(255);
  bird1.display();
  bird2.display();
  wing1.display();
  wing2.display();
  
  bird1.move();
  bird2.move();
  wing1.moveWings();
  wing2.moveWings();
  wing1.flap();
  wing2.flap();
}