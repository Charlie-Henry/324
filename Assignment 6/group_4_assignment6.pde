
ArrayList<Firework> fireworks;
PVector grav = new PVector(0, .1);

Car car1;
PShape theCar;

Trajectory mass1;
float x,y,xo,yo,vxo,vyo,t;
int index;
PShape flyingObject;
  


void setup() {
  size(500, 500);
  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
  
  car1 = new Car(30,450,1,0,0,0,10, 250, .2, .2,0);
  
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

void draw() {
  if (random(1) < 0.05) {
    fireworks.add(new Firework());
  }
  noStroke();
  rect(0,0,width-10,height-10);
  background(0);

  
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework work = fireworks.get(i);
    work.run();
    if (work.EndFirework()) {
      fireworks.remove(i);
    }
  }
  
  car1.applyForces(3, 0);
  car1.locCar();
  car1.spring();
  
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