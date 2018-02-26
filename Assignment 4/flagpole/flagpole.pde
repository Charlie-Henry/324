PShape flagPole, flag, pole;
AnimateFlag flag1,flag2;
void setup(){
  size(500,500);
  int flagX = 0;
  int flagY = 250;
  int flagHeight = 250;
  int speed = 1;
  
  PShape olympicFlag = createShape(GROUP);
  PShape pole = createShape(RECT, flagX,flagY,5,flagHeight);
  pole.setFill(0);
  PShape flag = createShape();
  flag.beginShape();
  flag.vertex(flagX+6,flagY);
  flag.vertex(flagX+106,flagY);
  flag.vertex(flagX+106,flagY+50);
  flag.vertex(flagX+6,flagY+50);
  flag.endShape();
  
  
  PShape blackRing = createShape(ELLIPSE, flagX+56,flagY+20,15,15);
  blackRing.setStroke(0);
  blackRing.setStrokeWeight(3);
  
  PShape blueRing = createShape(ELLIPSE, flagX+38,flagY+20,15,15);
  blueRing.setStroke(color(50,107,247));
  blueRing.setStrokeWeight(3);
  
  PShape redRing = createShape(ELLIPSE, flagX+74,flagY+20,15,15);
  redRing.setStroke(color(247,66,50));
  redRing.setStrokeWeight(3);
  
  PShape yellowRing = createShape(ELLIPSE, flagX+47,flagY+30,15,15);
  yellowRing.setStroke(color(252,230,23));
  yellowRing.setStrokeWeight(3);
  
  PShape greenRing = createShape(ELLIPSE, flagX+65,flagY+30,15,15);
  greenRing.setStroke(color(67,216,35));
  greenRing.setStrokeWeight(3);
  
  //flagPole.addChild(pole);
  olympicFlag.addChild(flag);
  olympicFlag.addChild(blueRing);
  olympicFlag.addChild(yellowRing);
  olympicFlag.addChild(blackRing);
  olympicFlag.addChild(greenRing);
  olympicFlag.addChild(redRing);
  
  flag1 = new AnimateFlag(pole,olympicFlag,flagX,flagY,flagHeight,speed);
  
  flagX = 110;
  flagY = 250;
  flagHeight = 250;
  speed=2;
  
  
  olympicFlag = createShape(GROUP);
  pole = createShape(RECT, flagX,flagY,5,flagHeight);
  pole.setFill(0);
  flag = createShape();
  flag.beginShape();
  flag.vertex(flagX+6,flagY);
  flag.vertex(flagX+106,flagY);
  flag.vertex(flagX+106,flagY+50);
  flag.vertex(flagX+6,flagY+50);
  flag.endShape();
  
  
  blackRing = createShape(ELLIPSE, flagX+56,flagY+20,15,15);
  blackRing.setStroke(0);
  blackRing.setStrokeWeight(3);
  
  blueRing = createShape(ELLIPSE, flagX+38,flagY+20,15,15);
  blueRing.setStroke(color(50,107,247));
  blueRing.setStrokeWeight(3);
  
  redRing = createShape(ELLIPSE, flagX+74,flagY+20,15,15);
  redRing.setStroke(color(247,66,50));
  redRing.setStrokeWeight(3);
  
  yellowRing = createShape(ELLIPSE, flagX+47,flagY+30,15,15);
  yellowRing.setStroke(color(252,230,23));
  yellowRing.setStrokeWeight(3);
  
  greenRing = createShape(ELLIPSE, flagX+65,flagY+30,15,15);
  greenRing.setStroke(color(67,216,35));
  greenRing.setStrokeWeight(3);
  
  //flagPole.addChild(pole);
  olympicFlag.addChild(flag);
  olympicFlag.addChild(blueRing);
  olympicFlag.addChild(yellowRing);
  olympicFlag.addChild(blackRing);
  olympicFlag.addChild(greenRing);
  olympicFlag.addChild(redRing);
  
  flag2 = new AnimateFlag(pole,olympicFlag,flagX,flagY,flagHeight,speed);
  
  //shape(pole);
  //shape(olympicFlag);
}

void draw(){
  //beginShape();
  //vertex(30,20);
  //vertex(85,20);
  //vertex(85,75);
  //vertex(30,75);
  ////endShape();
  //endShape(CLOSE);
  //shape(flagPole,0,0);
  background(255);
  
  flag1.display();
  flag1.translateX();
  flag1.translateY();
  
  flag2.display();
  flag2.translateX();
  flag2.translateY();
  
}