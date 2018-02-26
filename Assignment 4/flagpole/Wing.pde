class Wing {
  PShape aWings1;
  PShape aWings2;
  float x;
  float y;
  PVector speed;
  float birdHeight;
  Wing(PShape aWings1, PShape aWings2, float x, float y, PVector speed, float birdHeight){
    this.aWings1 = aWings1;
    this.aWings2 = aWings2;
    this.x = x;
    this.y = y;
    this.birdHeight = birdHeight;
  }
  
  void display(){
    shape(aWings1);
    shape(aWings2);
  }
  
  void moveWings() {
    x += 10;
    if (x >= 500) {
      x = 0;
      aWings1.translate(-500,0);
      aWings2.translate(-500,0);
    }
    aWings1.translate(10,0);
    aWings2.translate(10,0);
  }
  
  void flap() {
    y += 2;
    if (y >= 20) {
      y = 0;
      aWings1.translate(0, 20);
      aWings2.translate(0, -20);
    }
    aWings1.translate(0,-2);
    aWings2.translate(0,2);
  }

}