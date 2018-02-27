class AnimateBody{
  
  PShape body, head, leftLeg,rightLeg,leftArm,rightArm, handle, fire;
  int bodyXstart, bodyYstart, bodyXend, bodyYend, speed,placeHolder,handleX,handleY,fireX,fireY;
  int direction=1;
  int count=1;
  int heightVar=500;
  int counter1=1;
  
  AnimateBody(PShape body, PShape head, PShape leftArm, PShape rightArm,PShape leftLeg, PShape rightLeg, int bodyXstart, int bodyYstart, int bodyXend, int bodyYend, int speed, int placeHolder,PShape handle, PShape fire, int handleX, int handleY, int fireX, int fireY){
    this.body=body;
    this.head=head;
    this.leftArm=leftArm;
    this.rightArm=rightArm;
    this.leftLeg=leftLeg;
    this.rightLeg=rightLeg;
    this.bodyXstart=bodyXstart;
    this.bodyYstart=bodyYstart;
    this.bodyXend=bodyXend;
    this.bodyYend=bodyYend;
    this.speed=speed;
    this.placeHolder=placeHolder;
    this.handle=handle;
    this.fire=fire;
    this.handleX=handleX;
    this.handleY=handleY;
    this.fireX=fireX;
    this.fireY=fireY;
  }
  void display(){
   
      shape(body);
      shape(head);
      shape(leftArm);
      shape(rightArm);
      shape(leftLeg);
      shape(rightLeg);
      shape(fire);
      shape(handle);
    

  }
    
  void translateX(){
    
     
   
    if (placeHolder==1){
      if (bodyXstart>=480){
        speed=-2;
      }
      if (bodyXstart<=40){
        speed=2;
      }
      body.translate(speed,0);
      head.translate(speed,0);
      leftArm.translate(speed,0);
      rightArm.translate(speed,0);
      leftLeg.translate(speed,0);
      rightLeg.translate(speed,0);
      fire.translate(speed,0);
      handle.translate(speed,0);
      
      
      }
    
    else{
      if (bodyXstart>=470){
        speed=-2;
      }
      if (bodyXstart<=40){
        speed=2;
      }
     
      body.translate(speed,0);
      head.translate(speed,0);
      leftArm.translate(speed,0);
      rightArm.translate(speed,0);
      leftLeg.translate(speed,0);
      rightLeg.translate(speed,0);
      fire.translate(speed,0);
      handle.translate(speed,0);
      
    } 
    bodyXstart+=speed;
 println(bodyXstart);
  }
  
    void translateY(){
    if ((handleY-50) <=0){
      direction = -1;
    }
    if (handleY > 365){
      direction = 1;
    }
    if (handleY <= 335){
      direction=-1;
    }
    handle.translate(0,direction);
    fire.translate(0,direction);
    handleY = handleY - (direction*1);
    }
  }