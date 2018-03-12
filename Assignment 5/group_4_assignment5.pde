Planet earth1;
PImage sunPic;
PImage earth;
PImage moon;
PShape sun;



void setup() {
  size(500, 500, P3D); 
   sunPic = loadImage("sun.jpg");
   earth = loadImage("earth.jpg");
   moon = loadImage("moon.jpg");
   earth1 = new Planet(100, 24, earth, moon);
   
  }

void draw() {
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  noStroke();
  noFill();
  sun = createShape(SPHERE,50);
  sun.setTexture(sunPic);
  rotateY(radians(frameCount*2));
  shape(sun);
  
  earth1.reset();
  earth1.display();
  
  popMatrix();
  
}