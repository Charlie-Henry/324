class Button{
  float x,y,h,w;
  String buttonText;
  Button(float x,float y,float w,float h,String buttonText){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.buttonText = buttonText;
  }
  
  void showButton(){
    rectMode(CORNER);
    fill(255);
    rect(x,y,w,h);
    fill(0);
    text(buttonText,x+6,y+13);
    
  }
  
  public boolean checkPress(){
    if (mouseX>= x && mouseX <= (x+w) && mouseY >= y && mouseY <=(y+h)){
      return true;
    }
    else{
      return false;
    }
  }
  
}