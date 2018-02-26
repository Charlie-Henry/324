class Bird {
  float x;
  float y;
  PVector speed;
  PShape aBird1;
  
  Bird(PShape aBird1, float x, float y, PVector speed) {
    this.x = x;
    this.y = y;
    this.speed = speed; 
    this.aBird1 = aBird1;
  }
  
  
  void display() {
    shape(aBird1);
  }
  
  void move(){
    x += 10;
    if (x >= 500) {
      x = 0;
      aBird1.translate(-500,0);
    }
    aBird1.translate(10,0);
  }
}