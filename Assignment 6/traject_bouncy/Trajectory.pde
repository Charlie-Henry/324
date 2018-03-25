class Trajectory{
 float x,y,xo,yo,vxo,vyo;
 PShape object;
 int objIndex;
 Trajectory(float x,float y,float xo,float yo,float vxo, float vyo,int objIndex){
   this.x=x;
   this.y=y;
   this.xo = xo;
   this.yo = yo;
   this.vxo = vxo;
   this.vyo = vyo;
   this.objIndex = objIndex;
 }
 
 void displayProjectile(){
   if (objIndex == 0){
    PShape olympicFlag = createShape(GROUP);
    PShape flag = createShape();
    flag.beginShape();
    flag.vertex(x+6,y);
    flag.vertex(x+106,y);
    flag.vertex(x+106,y+50);
    flag.vertex(x+6,y+50);
    flag.endShape();
    
    
    PShape blackRing = createShape(ELLIPSE, x+56,y+20,15,15);
    blackRing.setStroke(0);
    blackRing.setStrokeWeight(3);
    
    PShape blueRing = createShape(ELLIPSE, x+38,y+20,15,15);
    blueRing.setStroke(color(50,107,247));
    blueRing.setStrokeWeight(3);
    
    PShape redRing = createShape(ELLIPSE, x+74,y+20,15,15);
    redRing.setStroke(color(247,66,50));
    redRing.setStrokeWeight(3);
    
    PShape yellowRing = createShape(ELLIPSE, x+47,y+30,15,15);
    yellowRing.setStroke(color(252,230,23));
    yellowRing.setStrokeWeight(3);
    
    PShape greenRing = createShape(ELLIPSE, x+65,y+30,15,15);
    greenRing.setStroke(color(67,216,35));
    greenRing.setStrokeWeight(3);
    
    olympicFlag.addChild(flag);
    olympicFlag.addChild(blueRing);
    olympicFlag.addChild(yellowRing);
    olympicFlag.addChild(blackRing);
    olympicFlag.addChild(greenRing);
    olympicFlag.addChild(redRing);
    object = olympicFlag;
  }
  
  if (objIndex == 1){
    PShape fire=createShape(TRIANGLE, x, y, x+2, y-12, x+4, y);
    fire.setStroke(color(242,125,12));
    fire.setStrokeWeight(4);
    object = fire;
  }
  
  if (objIndex == 2){
    PShape handle= createShape(RECT,x,y,4,30);
    handle.setStroke(color(165,165,165));
    handle.setStrokeWeight(4);
    object = handle;
  }
  
  if (objIndex == 3){
    object = createShape(ELLIPSE,x,y,10,10);
    object.setFill(#834511);
  } 
   
   shape(object);
 }
 
 public float moveProjectile(float t){
   float g = -1;
   x = vxo *t + xo;
   y = -vyo*t - (.5*g*t*t) + yo;
   return y;
 }
}