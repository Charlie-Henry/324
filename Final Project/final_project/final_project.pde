//Game States
// 0 = move target into position
// 1 = Trajectory throw
// 2 = Mid-throw check target and score
// 3 = Pause Screen
// 4 = Intructions
// 5 = win screen
// 6 = main menu
// 7 = player name enter
// 8 = past games

//The song is The Globetrotters Theme Song
//by Sweet Georgia Brown

PImage court;

Trajectory mass1;

Target target1;
Button continueButton;
Button quitButton;
Button resetButton;
Button endButton;

//main menu buttons
Button instructions;
Button startGame;
Button mainMenuQuit;
Button highscores;
Button mainMenuButton;
float [] menuTime;
Trajectory [] menuMasses;

Table pastGames,buffer;
String playerOneName;
String playerTwoName;

PShape circle,arrowN,arrowS,arrowE,arrowW;
float cursorTime=0;


float x,y,xo,yo,vxo,vyo,t,targetX,targetY;
int gameState,prevState,playerNum,score1,score2;
int XPosition = 200;
int YPosition = 200;
int playerCount = 1;
int soundCount=0;

import processing.sound.*;
SoundFile file;
String audioName = "HarlemGlobetrotters.mp3";
String path;

boolean updateScores = true;

void setup(){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
  court=loadImage("court.png");
  pastGames = loadTable("games.csv");
  buffer = loadTable("buffer.csv");
  
  
  gameState = 6;
  xo = 10;
  yo = 490;
  vxo = 10;
  vyo = 10;
  x=0;
  score1 = 0;
  score2 = 0;
  targetX = 475;
  targetY = 300;
  playerNum = 1;
  size(500,500);
  background(200);
  
  playerOneName = "";
  playerTwoName = "";
  mass1 = new Trajectory(0,250,xo,yo,10,10,targetX,targetY);
  target1 = new Target(targetX,targetY);
  continueButton = new Button(200,200,110,20,"Click to Continue");
  quitButton = new Button(200,300,100,20,"Click to Quit");
  resetButton = new Button(200,350,150,20,"Click to Play Again");
  mainMenuButton = new Button(200,450,150,20,"Click to Return to Menu");
  endButton = new Button(200,300,150,20,"Click to Quit");
  
  //main menu
  startGame = new Button(200,100,100,20,"Start Game");
  instructions = new Button(200,200,100,20,"Instructions");
  highscores = new Button(200,300,100,20,"Recent Scores");
  mainMenuQuit = new Button(200,400,100,20,"Quit");
  
  menuMasses = new Trajectory[10];
  menuTime = new float[10];
  for(int i = 0; i<10;i++){
    float mouY = random(10,30);
    float mouX = random(10,30);
    float theta = atan((yo-mouY)/(mouX-xo));
    vxo = abs(mouX-xo)*.1*cos(theta)*.9;
    vyo = abs(yo-mouY)*.1*sin(theta)*.9;
    menuMasses[i] = new Trajectory(xo,yo,xo,yo,mouX,mouY,targetX,targetY);
    menuTime[i] = 0;
  }
 
}

void draw(){
  
  
  
  if (gameState == 0) {
    background(court);
    target1.displayTarget();
    text("Use arrow keys to move target into position",200,450);
    text("Then press enter",200,470);
  }
  
  
  if (gameState == 1) {
    background(court);
    stroke(255,16,11);{
    line(xo,yo,mouseX,mouseY); 
    }
    fill(color(#FF5D5D));
    ellipseMode(CENTER);
    circle = createShape(ELLIPSE, mouseX,mouseY,15,15);
    rectMode(CORNERS);
    arrowN = createShape(RECT, mouseX-2,mouseY-15-5-1,mouseX,mouseY-15+(cursorTime*5)-1);
    arrowS = createShape(RECT, mouseX-2,mouseY+15+1+5,mouseX,mouseY+15-(cursorTime*5)+1);
    arrowW = createShape(RECT, mouseX-15-5-1,mouseY-2,mouseX-15-1+(cursorTime*5),mouseY);
    arrowE = createShape(RECT, mouseX+15+1+5,mouseY-2,mouseX+15+1-(cursorTime*5),mouseY);
    
    shape(circle);
    shape(arrowN);
    shape(arrowS);
    shape(arrowW);
    shape(arrowE);
    if (cursorTime<1){
      cursorTime+=.01;
    }
    else{
      cursorTime = 0;
    }
    
    
    
    stroke(0);
  } 
  if (gameState == 2){
    background(court);
    t+=.5;
    mass1.displayProjectile();
    y = mass1.moveProjectile(t);
    target1.displayTarget();
    
    if (mass1.checkTarget()){
      gameState = 0;
      if (playerNum == 1){
        score1++;
      }
      if (playerNum == 2){
        score2++;
      }
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
  
  if (gameState==4){
    background(12,123,21);
    textSize(10);
    text("Instructions", 10, 30); 
    text("1: Player 1 will use the arrow keys to move the target in any direction.", 10, 60); 
    text("   Once you have selected a place hit the ENTER button.", 10, 90); 
    text("2: Now Player 2 will use the Mouse or trackpad to aim.", 10, 120); 
    text("   One you are done aiming click to shoot", 10, 150); 
    text("3: Once you have shot the roles for each player switch. If your shot is good, your score will go up.", 10, 180);
    text("4: First to 5 points wins!", 10, 210); 
    text("5: Press the 'P' button at any time to pause the game", 10, 240); 
    text("6: Press the 'S' button to return to the main menu!", 10, 270); 
    text("7: Press the 'M' button to stop the music.", 10, 300); 

    
    
    //fill(0, 102, 153);
  }
 
   if (gameState == 0 ||gameState == 1||gameState == 2||gameState == 3){
    rectMode(CORNER);
    fill(color(#D3D3D3));
    rect(0,0,499,25);
    fill(color(#FFFFFF));
    rect(0,25,499,2);
    fill(0);
    textSize(20);
   
    if (playerNum == 1){
      text(playerOneName+"'s Turn",15,20);
      text(score1,460,20);
    }
    if (playerNum == 2){
      text(playerTwoName+"'s Turn",15,20);
      text(score2,460,20);
    }
    text("Score: ",400,20);
    target1.displayTarget();
  
    
    textSize(10);
  }
  
  if (score1 > 4){
    gameState  = 5;
    textSize(50);
    fill(255);
    text(playerOneName+" Wins!",30,250);
    fill(0);
    textSize(10);
    
    if (updateScores){
      buffer.clearRows();
      buffer.addRow();
      buffer.addColumn();
      buffer.addColumn();
      buffer.addColumn();
      buffer.addColumn();
      buffer.setInt(0,0,score1);
      buffer.setInt(0,1,score2);
      buffer.setString(0,2,playerOneName);
      buffer.setString(0,3,playerTwoName);
      
      for(int i = 1; i<5;i++){
        buffer.addRow();
        buffer.setInt(i,0,pastGames.getInt(i-1,0));
        buffer.setInt(i,1,pastGames.getInt(i-1,1));
        buffer.setString(i,2,pastGames.getString(i-1,2));
        buffer.setString(i,3,pastGames.getString(i-1,3));
      }
      saveTable(buffer, "games.csv");
      updateScores = false;
    }
  }
  
  if (score2 > 4){
    gameState  = 5;
    textSize(50);
    fill(255);
    text(playerTwoName+" Wins!",30,250);
    fill(0);
    textSize(10);
    if (updateScores){
      buffer.clearRows();
      buffer.addRow();
      buffer.addColumn();
      buffer.addColumn();
      buffer.addColumn();
      buffer.addColumn();
      buffer.setInt(0,0,score1);
      buffer.setInt(0,1,score2);
      buffer.setString(0,2,playerOneName);
      buffer.setString(0,3,playerTwoName);
      
      for(int i = 1; i<5;i++){
        buffer.addRow();
        buffer.setInt(i,0,pastGames.getInt(i-1,0));
        buffer.setInt(i,1,pastGames.getInt(i-1,1));
        buffer.setString(i,2,pastGames.getString(i-1,2));
        buffer.setString(i,3,pastGames.getString(i-1,3));
      }
      saveTable(buffer, "games.csv");
      updateScores = false;
    }
    
  }
  
  if (gameState == 5){
    resetButton.showButton();
    endButton.showButton();
    mainMenuButton.showButton();
  }
  
  if (gameState == 6){
    background(0);
    
    
    for (int i = 0; i<10;i++){
      menuTime[i]+=.5;    
      y = menuMasses[i].moveProjectile(menuTime[i]);
      menuMasses[i].displayProjectile();
      
      if (menuMasses[i].checkMiss()){        
        float mouY = random(10,30);
        float mouX = random(10,30);
        float theta = atan((yo-mouY)/(mouX-xo));
        vxo = abs(mouX-xo)*.1*cos(theta)*.9;
        vyo = abs(yo-mouY)*.1*sin(theta)*.9;
        menuMasses[i] = new Trajectory(xo,yo,xo,yo,mouX,mouY,targetX,targetY);
        menuTime[i] = 0;
      }
    }
    
    
    textSize(25);
    fill(255);
    text("BevoBall",200,30);
    fill(0);
    textSize(10);
    instructions.showButton();
    startGame.showButton();
    mainMenuQuit.showButton();
    highscores.showButton();
    
  }
  
  if (gameState == 7){
    background(200);
    rectMode(CORNER);
    fill(255);
    rect(200,200,120,20);
    rect(200,400,120,20);
    
    fill(0);
    text(playerTwoName,210,412);
    text("Player Two Name:",200,400);
    text("Player One Name:",200,200);
    text(playerOneName,210,212);
    text("Enter 3 characters for each player name then press any key to continue.",20,450);
  }
  
  if (gameState == 8){
    //display last 5 games
    pastGames = loadTable("games.csv");
    textSize(25);
    background(0);
    fill(255);
    text("Last 5 Games",200,30);
    textSize(10);
    for(int i = 1;i<6;i++){
      text(pastGames.getString(i-1,2),200,(40*i)+80);
      text(pastGames.getString(i-1,3),300,(40*i)+80);
      text(pastGames.getInt(i-1,0),200,(40*i)+20+80);
      text(pastGames.getInt(i-1,1),300,(40*i)+20+80);
    }
    text("Press S to return to Main Menu",200,400);
  }
 
  
}


void mousePressed(){
  if (gameState == 1){
    float theta = atan((yo-mouseY)/(mouseX-xo));
    vxo = abs(mouseX-xo)*.1*cos(theta)*.9;
    vyo = abs(yo-mouseY)*.1*sin(theta)*.9;
    mass1 = new Trajectory(xo,yo,xo,yo,vxo,vyo,targetX,targetY);
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
  
  if (gameState == 5){
    if (resetButton.checkPress()){
      score1 = 0;
      score2 = 0;
      playerNum = 1;
      gameState = 0;
    }
    if (mainMenuButton.checkPress()){
      score1 = 0;
      score2 = 0;
      playerNum = 1;
      gameState = 6;
      playerOneName = "";
      playerTwoName = "";
    }
    if (endButton.checkPress()){
      exit();
     
    }
  }
  
  if (gameState == 6){
    if (instructions.checkPress()){
      gameState = 4;
    }
    if (mainMenuQuit.checkPress()){
      exit();
    }
    if (startGame.checkPress()){
      
      gameState = 7;
    }
    if (highscores.checkPress()){
      gameState = 8;
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
        if (playerNum == 1){
          playerNum = 2;
        }
        else{
          playerNum = 1;
        }
      }
  }
  if (gameState == 0 ||gameState == 1||gameState == 2||gameState == 3){
    if (key == 'p'){
      prevState = gameState;
      gameState = 3;
    }
  }
  if (gameState == 4){
    if (key == 's'){
      gameState = 6;
      background(200);
    }
  }
  if (gameState == 8){
    if (key == 's'){
      gameState = 6;
    }
  }
  if(gameState == 7){
    if (playerOneName.length()<3){
      if (key >= 'A' && key <= 'Z'){
         playerOneName = playerOneName +key;
      }
      
      if (key >= 'a' && key <= 'z'){
         playerOneName = playerOneName +key;
      }
     
    }
    else if (playerTwoName.length()<3){
      if (key >= 'A' && key <= 'Z'){
         playerTwoName = playerTwoName +key;
      }
      
      if (key >= 'a' && key <= 'z'){
         playerTwoName = playerTwoName +key;
      }
    }
    else{
      playerOneName = playerOneName.toUpperCase();
      playerTwoName = playerTwoName.toUpperCase();
      gameState = 0;
    }
    
  }
  
  if (key=='m' && gameState !=7){
    
    if (soundCount%2==0){
      file.stop();
    }
    else{
      file.play();
    }
    soundCount+=1;
  }
  
  
  }
