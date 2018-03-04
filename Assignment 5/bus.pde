float x = 0;
PShape bus;
BoxMovie bx1;
void setup(){
 size(500, 500, P3D); 
 bx1 = new BoxMovie(25,15,15);
 camera(0,0,100,0,0,0,0,1,0);
 
 //bus = createShape();
 //bus.beginShape();
 
 //bus.fill(255);
 //bus.endShape();
 
}

void draw(){
  background(0);
  
  /*
  beginCamera();
  camera(0,0,100,0,0,0,0,1,0);
  rotateX(x+=PI/1000);
  rotateZ(x+=PI/5000);
  endCamera();
  */
  //bx1.display();
  bx1.moveBus();
  bx1.moveBlast();
  //translate(25,0,0);
  
  //fill(color(50,50,50));
  //stroke(255);
  //shape(bus);
  /*
  translate(25,0,0);
  sphere(10);

  translate(-50,0,0);
  box(15,15,15);
  */
  
}