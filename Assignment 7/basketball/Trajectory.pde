class Trajectory{
 float x,y,xo,yo,vxo,vyo,targetX,targetY;
 PShape object;
 Trajectory(float x,float y,float xo,float yo,float vxo, float vyo,float targetX,float targetY){
   this.x=x;
   this.y=y;
   this.xo = xo;
   this.yo = yo;
   this.vxo = vxo;
   this.vyo = vyo;
   this.targetX = targetX;
   this.targetY = targetY;
 }
 
 void displayProjectile(){
  object = createShape(ELLIPSE,x,y,10,10);
  object.setFill(#834511);
  shape(object);
 }
 
 public float moveProjectile(float t){
   float g = -1;
   x = vxo *t + xo;
   y = -vyo*t - (.5*g*t*t) + yo;
   return y;
 }
 
 public boolean checkTarget(){
   if (x <= (targetX+12.5) && x >= (targetX-12.5)){
     if (y <= (targetY+20) && y >= (targetY-20)){
       return true;
     }
   }
   return false;
   
 }
 
 public boolean checkMiss(){
   if (x>=510){
     
     return true;
     
   }
   
   return false;
   
 }
}