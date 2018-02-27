Bird bird1;
Bird bird2;
Wing wing1;
Wing wing2;
PShape aBird1,aBird2,aWings1,aWings2;

PShape flagPole, flag, pole;
AnimateFlag flag1,flag2;
import processing.sound.*;
SoundFile file;
String audioName = "bensound-acousticbreeze.mp3";
String path;

PShape body,head,leftLeg,rightLeg,leftArm,rightArm,handle, fire;
AnimateBody Person1, Person2, torch1;

void setup(){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
  size(500,500);
  
  PVector p1 = new PVector(25, 0);
  PVector p2 = new PVector(50, 0);
  

  aBird1 = createShape(GROUP);
  PShape body1 = createShape(RECT, 50, 50, 70, 40);
  PShape head1 = createShape(TRIANGLE, 50 + 70, 50, 50 + 70, 50 + 40, 50 + 100, 50 + 20);
  aBird1.addChild(body1);
  aBird1.addChild(head1);
  bird1 = new Bird(aBird1, 50, 50, p1);
  
  
  aWings1 = createShape(GROUP);
  PShape wingOne1 = createShape(TRIANGLE, bird1.x, bird1.y + 40, bird1.x + 70, bird1.y + 40, bird1.x + 35, bird1.y + 65);
  PShape wingTwo1 = createShape(TRIANGLE, bird1.x, bird1.y, bird1.x + 70, bird1.y, bird1.x + 35, bird1.y - 25);
  aWings1.addChild(wingOne1);
  aWings1.addChild(wingTwo1);
  wing1 = new Wing(wingOne1, wingTwo1, 50, 50, p1, 70);
  
  
  
  aBird2 = createShape(GROUP);
  PShape body2 = createShape(RECT, 50, 200, 70, 40);
  PShape head2 = createShape(TRIANGLE, 50 + 70, 200, 50 + 70, 200 + 40, 50 + 100, 200 + 20);
  aBird2.addChild(body2);
  aBird2.addChild(head2);
  bird2 = new Bird(aBird2, 50, 200, p2);
  

  aWings2 = createShape(GROUP);
  PShape wingOne2 = createShape(TRIANGLE, bird2.x, bird2.y + 40, bird2.x + 70, bird2.y + 40, bird2.x + 35, bird2.y + 65);
  PShape wingTwo2 = createShape(TRIANGLE, bird2.x, bird2.y, bird2.x + 70, bird2.y, bird2.x + 35, bird2.y - 25);
  aWings2.addChild(wingOne2);
  aWings2.addChild(wingTwo2);
  wing2 = new Wing(wingOne2, wingTwo2, 50, 200, p2, 220);
  
  
  
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
  
  olympicFlag.addChild(flag);
  olympicFlag.addChild(blueRing);
  olympicFlag.addChild(yellowRing);
  olympicFlag.addChild(blackRing);
  olympicFlag.addChild(greenRing);
  olympicFlag.addChild(redRing);
  
  flag2 = new AnimateFlag(pole,olympicFlag,flagX,flagY,flagHeight,-1);
  
  
  int bodyXstart=30;
  int bodyYstart=400;
  int bodyXend=30;
  int bodyYend=450;
  //int speed = 1; 
  int placeHolder=1;
  
  PShape Person= createShape(GROUP);
  PShape body = createShape(LINE,bodyXstart,bodyYstart,bodyXend,bodyYend);
  
  PShape head=createShape(ELLIPSE,bodyXstart, bodyYstart-7, 15, 15);

  PShape leftLeg = createShape(LINE,bodyXend,bodyYend,bodyXend-20,bodyYend+20);
  PShape rightLeg = createShape(LINE,bodyXend,bodyYend,bodyXend+20,bodyYend+20);
  PShape leftArm = createShape(LINE,bodyXstart,bodyYstart+10,bodyXstart-20,bodyYstart-20);
  PShape rightArm = createShape(LINE,bodyXstart,bodyYstart+10,bodyXstart+20,bodyYstart-20);
    
  
  Person.addChild(body);
  Person.addChild(head);
  Person.addChild(leftLeg);
  Person.addChild(rightLeg);
  Person.addChild(leftArm);
  Person.addChild(rightArm);
  
  int handleX=45;
  int handleY=360;
  int fireX=45;
  int fireY=360;
  
  
  PShape olympicTorch=createShape(GROUP);
  PShape handle= createShape(RECT,handleX,handleY,4,30);
  handle.setStroke(color(165,165,165));
  handle.setStrokeWeight(4);
  
  PShape fire=createShape(TRIANGLE, fireX, fireY, fireX+2, fireY-12, fireX+4, fireY);
  fire.setStroke(color(242,125,12));
  fire.setStrokeWeight(4);
  
  olympicTorch.addChild(handle);
  olympicTorch.addChild(fire);

  Person1= new AnimateBody(body,head, leftArm,  rightArm, leftLeg,  rightLeg,  bodyXstart,  bodyYstart,  bodyXend,  bodyYend,  speed,placeHolder, handle, fire, handleX, handleY, fireX, fireY);
  
  bodyXstart=450;
  bodyYstart=400;
  bodyXend=450;
  bodyYend=450;
  placeHolder=0;

  Person= createShape(GROUP);
  body = createShape(LINE,bodyXstart,bodyYstart,bodyXend,bodyYend);
  
  head=createShape(ELLIPSE,bodyXstart, bodyYstart-7, 15, 15);

  leftLeg = createShape(LINE,bodyXend,bodyYend,bodyXend-20,bodyYend+20);
  rightLeg = createShape(LINE,bodyXend,bodyYend,bodyXend+20,bodyYend+20);
  leftArm = createShape(LINE,bodyXstart,bodyYstart+10,bodyXstart-20,bodyYstart-20);
  rightArm = createShape(LINE,bodyXstart,bodyYstart+10,bodyXstart+20,bodyYstart-20);
    
  
  Person.addChild(body);
  Person.addChild(head);
  Person.addChild(leftLeg);
  Person.addChild(rightLeg);
  Person.addChild(leftArm);
  Person.addChild(rightArm);
  
  handleX=430;
  handleY=360;
  fireX=430;
  fireY=360;
  
  olympicTorch=createShape(GROUP);
  handle= createShape(RECT,handleX,handleY,4,30);
  handle.setStroke(color(165,165,165));
  handle.setStrokeWeight(4);
  
  fire=createShape(TRIANGLE, fireX, fireY, fireX+2, fireY-12, fireX+4, fireY);
  fire.setStroke(color(242,125,12));
  fire.setStrokeWeight(4);
  
  olympicTorch.addChild(handle);
  olympicTorch.addChild(fire);

  Person2= new AnimateBody(body,head, leftArm,  rightArm, leftLeg,  rightLeg,  bodyXstart,  bodyYstart,  bodyXend,  bodyYend,  speed,placeHolder, handle, fire, handleX, handleY, fireX, fireY);
  

}

void draw(){
  background(255);
  
  // olympic flag #1
  flag1.display();
  flag1.translateX();
  flag1.translateY();
  
  // olympic flag #2
  flag2.display();
  flag2.translateX();
  flag2.translateY();
  
  // bird 1
  bird1.display();
  bird2.display();
  wing1.display();
  wing2.display();
  
  // bird 2
  bird1.move();
  bird2.move();
  wing1.moveWings();
  wing2.moveWings();
  wing1.flap();
  wing2.flap();
  
  Person1.display();
  Person1.translateX();
  Person1.translateY();
  
  Person2.display();
  Person2.translateX();
  Person2.translateY();
  
}
