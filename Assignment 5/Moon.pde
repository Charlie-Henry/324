class Moon {
  float orbit;      
  float size;   
  float distance;   
  float rotationspeed; 
  PImage moonpic;
  PShape moon;
  
  Moon(float distance, float size, PImage moonpic) {
    this.distance = distance;
    this.size = size;
    orbit = 0;
    rotationspeed = -0.03;
    this.moonpic= moonpic;
  }
  
  void reset() {
    orbit += rotationspeed;
  }
  
  void display() {
    pushMatrix(); 
    rotate(orbit); 
    translate(distance,0); 
    noStroke();
    noFill();
    moon = createShape(SPHERE,size);
    moon.setTexture(moonpic);
    rotateY(radians(frameCount*2));
    shape(moon);
    popMatrix(); 
  }
}