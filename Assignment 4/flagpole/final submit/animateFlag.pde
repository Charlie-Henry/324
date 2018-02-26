class AnimateFlag{
  PShape flagPole,flag;
  int flagX,flagY,flagHeight,speed;
  int direction = 1;
  
  AnimateFlag(PShape flagPole, PShape flag, int flagX, int flagY,int flagHeight, int speed){
    this.flagPole = flagPole;
    this.flag = flag;
    this.flagX = flagX;
    this.flagY = flagY;
    this.flagHeight = flagHeight;
    this.speed = speed;
  }
  void display(){
    shape(flagPole);
    shape(flag);
  }
  
  void translateX(){
    //flagX+=1;
    
    if (flagX>=500)
    {
      flag.translate(-500,0);
      flagPole.translate(-500,0);
      flagX-=500;
      
    }
    
    if (flagX<0)
    {
      flag.translate(500,0);
      flagPole.translate(500,0);
      flagX+=500;
      
    }
    
    flag.translate(speed,0);
    flagX+=speed;
    flagPole.translate(speed,0);
    
  }
  
  void translateY(){
    if ((flagY-50) <=0){
      direction = -1;
    }
    if (flagY > flagHeight){
      direction = 1;
    }
    flag.translate(0,direction);
    flagY = flagY - (direction*1);
  }
  
}