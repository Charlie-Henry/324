class Target{
  float x,y;
  Target(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void displayTarget(){
    rectMode(CENTER);
    fill(255);
    rect(x,y,25,40);
  }
  
}