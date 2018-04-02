Trajectory mass1;
Target target1;
Button continueButton;
Button quitButton;

float x,y,xo,yo,vxo,vyo,t,targetX,targetY;
int gameState,prevState;
void setup(){
  gameState = 0;
  xo = 10;
  yo = 490;
  vxo = 10;
  vyo = 10;
  x=0;
  targetX = 475;
  targetY = 300;
  size(500,500);
  background(95);
  mass1 = new Trajectory(0,250,xo,yo,10,10,targetX,targetY);
  target1 = new Target(targetX,targetY);
  continueButton = new Button(250,200,60,20,"Continue");
  quitButton = new Button(250,300,60,20,"Quit");
}

void draw(){
  
  if (gameState == 0) {
    background(200);
    target1.displayTarget();
  }
  
  
  if (gameState == 1) {
    background(95);
    line(xo,yo,mouseX,mouseY); 
  } 
  if (gameState == 2){
    background(40);
    t+=.5;
    mass1.displayProjectile();
    y = mass1.moveProjectile(t);
    target1.displayTarget();
    
    if (mass1.checkTarget()){
      gameState = 0;
    }
    
    if (mass1.checkMiss()){
      gameState = 0;
    }
  }
  
  if(gameState == 3){
    background(255);
    continueButton.showButton();
    quitButton.showButton();
  }
  target1.displayTarget();
}


void mousePressed(){
  if (gameState == 1){
    float theta = atan((yo-mouseY)/(mouseX-xo));
    vxo = abs(mouseX-xo)*.1*cos(theta)*.9;
    vyo = abs(yo-mouseY)*.1*sin(theta)*.9;
    mass1 = new Trajectory(xo,250,xo,yo,vxo,vyo,targetX,targetY);
    t=0;
    x=0;
    gameState = 2;
  }
  
  
  if (gameState == 3){
    if (continueButton.checkPress()){
      gameState = prevState;
      if (prevState ==3){
        gameState =0;
      }
    }
    
    if (quitButton.checkPress()){
      exit();
     
    }
  }
}

void keyPressed(){
  if (gameState == 0){
    if (key == CODED){
      if (keyCode == UP){
        if (targetY > 10){
          targetY-=5;
          target1 = new Target(targetX,targetY);
        }
      }
      if (keyCode == DOWN){
        if (targetY < 490){
          targetY+=5;
          target1 = new Target(targetX,targetY);
        }
      }
    }
    if (key == ENTER || key == RETURN){
        gameState =1;
      }
  }
  
  if (key == 'p'){
    prevState = gameState;
    gameState = 3;
  }
  
  
}