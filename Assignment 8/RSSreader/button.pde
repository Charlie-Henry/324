class Button{
  float x,y,h,w;
  Button(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void showButton(){
    rectMode(CORNER);
    fill(255);
    rect(x,y,w,h);
    fill(0);
    
  }
  
  public boolean checkPress(){
    if (mouseX>= x && mouseX <= (x+w) && mouseY >= y && mouseY <=(y+h)){
      return true;
    }
    else{
      return false;
    }
  }
  
  public boolean checkHover(){
    if (mouseX>= x && mouseX <= (x+w) && mouseY >= y && mouseY <=(y+h)){
      return true;
    }
    else{
      return false;
    }
  }
  
}
