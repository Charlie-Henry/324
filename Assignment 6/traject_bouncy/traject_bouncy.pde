Trajectory mass1;
float x,y,xo,yo,vxo,vyo,t;
int index;
PShape flyingObject;
void setup(){
  index = 0;
  xo = 10;
  yo = 250;
  vxo = 10;
  vyo = 10;
  x=0;
  size(500,500);
  background(95);
  mass1 = new Trajectory(0,250,xo,yo,10,10,0);
  
 
}

void draw(){
  background(95);
  line(xo,yo,mouseX,mouseY);  
  
  t+=1;
  mass1.displayProjectile();
  y = mass1.moveProjectile(t);
  if (y>500){
    float g = -1;
    vyo = -vyo - g*t;
    vyo = .75*vyo;
    x = x+ t*vxo;
    t = 0;
    y=499;
    mass1 = new Trajectory(x,y,x,y,vxo,vyo,index);
    
  }
}


void mousePressed(){
  float theta = atan((yo-mouseY)/(mouseX-xo));
  //println(theta);
  
  vxo = abs(mouseX-xo)*.1*cos(theta);
  vyo = abs(yo-mouseY)*.1*sin(theta);
  if (index >2){
    index = 0;
  }
  
  else{
    index+=1;
  }
  mass1 = new Trajectory(xo,250,xo,yo,vxo,vyo,index);
  t=0;
  x=0;
}