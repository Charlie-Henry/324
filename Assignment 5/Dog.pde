class Dog{
  float x;
  float y;
  float z;
  float a = 0;
  float b = 0;
  
  Dog (float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void moveDog(){
    pushMatrix();
    if (a > 75) {
      a = 0;
    }
    if (b > 10) {
      b = 0;
    }
    fill(139, 70, 19);
    translate(a, 0, 0);
    box(x, y, z);
    a += 0.8;
    b += 0.5;
    popMatrix();
  }
   
   void moveDogHead() {
     pushMatrix();
     fill(139, 70, 19);
     translate(6 + a, -10, 0);
     sphere(5);
     popMatrix();
   }
   
   void moveDogLeg1() {
     pushMatrix();
     fill(139, 70, 19);
     translate(-7 + a, 5 + b, 0);
     box(5, 20, 5);
     popMatrix();
   }
   
   void moveDogLeg2() {
     pushMatrix();
     fill(139, 70, 19);
     translate(7 + a, 5 + b, 0);
     box(5, 20, 5);
     popMatrix();
   }
}