class Planet {
  float orbit;      
  float size;  
  float distance;   
  float rotationspeed; 
  PImage earthpic;
  PImage moonpic;
  PShape earth;
  Moon moon;
 
  Planet(float distance, float size, PImage earthpic, PImage moonpic) {
    this.distance = distance;
    this.size = size;
    orbit = 0;
    rotationspeed = .05;
    this.earthpic=earthpic;
    this.moonpic=moonpic;
    moon = new Moon(30,8,moonpic);
  }
  
  void reset() {
    orbit += rotationspeed;
    moon.reset();
  }
  
  void display() {
    pushMatrix(); 
    rotate(orbit); 
    translate(distance,0); 
    noStroke();
    noFill();
    earth = createShape(SPHERE,size);
    earth.setTexture(earthpic);
    rotateY(radians(frameCount*2));
    shape(earth);
    moon.display();
    popMatrix(); 
  }
}