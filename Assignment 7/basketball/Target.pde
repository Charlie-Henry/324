class Target{
  float x,y;
  Target(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void displayTarget(){
    rectMode(CENTER);
    rect(x,y,10,20);
  }
  
}