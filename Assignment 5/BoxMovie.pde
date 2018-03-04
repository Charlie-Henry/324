class BoxMovie{
  float x,y,z;
  float i = 0;
  int t = 0;
  BoxMovie(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void moveBus(){
    pushMatrix();
    if (i >75){
      i = 0;
    }
    translate(i,0,0);
    fill(color(#EAEA0E));
    stroke(0);
    box(x,y,z);
    i+=.1;
    popMatrix();
  }
  
  void moveBlast(){
    pushMatrix();
    if (t >5){
     t=0; 
    }
    if (i >75){
      i = 0;
    }
    translate(-.5*x,0,0);
    translate(-1*t,0,0);
    translate(i,0,0);
    fill(color(#EA4D0E));
    stroke(color(#EA4D0E));
    sphere(5);
    i+=.1;
    t+=1;
    
    popMatrix();
  }
}