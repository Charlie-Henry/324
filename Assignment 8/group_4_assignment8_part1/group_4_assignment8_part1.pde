Table table;
int pop=0;
int eightteenpop=0;
int sixteenpop=0;
int tenpop=0;
float Perchange=0.0;

int x=50;
int y=640;
int gameState;
int rectY=625;
int rectX=50;

int w=0;

int GS1Count=0;


void setup() {
  background(200);
  fill(0);
  size(1000,650);
  gameState=0;  

  
  table = loadTable("CityPop.csv", "header");
  
  
}
  
void draw(){

  if (gameState == 0) {
    if (GS1Count==0){  
      background(200);
      textSize(20);
      text("Press Enter to Change",750,100);
      x=50;
      rectX=50;
      textSize(10);
      text("2018 Population",10,10);
      for (TableRow row : table.rows()) {
        eightteenpop = row.getInt("2018 Population");               
         int newpop=eightteenpop/15000;
         newpop=newpop*-1;
         rectX=rectX+80;
         rect(rectX,rectY, 20,newpop);
         String stringPop=str(eightteenpop);
         text(stringPop,rectX-10,newpop+620);   
         pop = row.getInt("2018 Population");
         String city = row.getString("Name");
         x=x+79;
         textSize(10);
         fill(0);
         text(city ,x,y);  
         line(100, 625, 900, 625);
         line(100, 625, 100, 25);    
      }
    GS1Count+=1;
  }
  }
    if (gameState == 1) {      
      if (GS1Count==1){
        background(200);
        textSize(20);
        text("Press Enter to Change",750,100);
        x=50;
        rectX=50;
        textSize(10);
        text("2016 Population",10,10);
        for (TableRow row : table.rows()) {
          sixteenpop = row.getInt("2016 Population");               
          int newpop=sixteenpop/15000;
           newpop=newpop*-1;
           rectX=rectX+80;
           rect(rectX,rectY, 20,newpop);
           String stringPop=str(sixteenpop);
           text(stringPop,rectX-10,newpop+620);
           pop = row.getInt("2018 Population");
           String city = row.getString("Name");    
           x=x+79;
           textSize(10);
           fill(0);
           text(city ,x,y); 
           line(100, 625, 900, 625);
           line(100, 625, 100, 25);
      }
    GS1Count+=1; 
  }
  }
    if (gameState == 2) {
      if (GS1Count==2){
        background(200);
        textSize(20);
        text("Press Enter to Change",750,100);
        x=50;
        rectX=50;
        textSize(10);
        text("2010 Population",10,10);
        text("From 2010 Census",10,20);
        for (TableRow row : table.rows()) {
          tenpop = row.getInt("2010 Census");               
          int newpop=tenpop/15000;
           newpop=newpop*-1;
           rectX=rectX+80;
           rect(rectX,rectY, 20,newpop);
           String stringPop=str(tenpop);
           text(stringPop,rectX-10,newpop+620);    
           pop = row.getInt("2018 Population");
           String city = row.getString("Name");    
           x=x+79;
           textSize(10);
           fill(0);
           text(city ,x,y);
           line(100, 625, 900, 625);
           line(100, 625, 100, 25);  
      }
    GS1Count+=1;
  }
  }
    if (gameState == 3) {
      if (GS1Count==3){
        background(200);
        textSize(20);
        text("Press Enter to Change",750,100);
        x=50;
        rectX=50;
        textSize(10);
        text("Percent Change",10,10);
        for (TableRow row : table.rows()) {
          Perchange = row.getFloat("Percent Change");               
          float newPerchange=Perchange*1000;
          newPerchange=newPerchange*-1;
          rectX=rectX+80;
          rect(rectX,rectY, 20,newPerchange);
          String stringPop=str(Perchange);
          text(stringPop+"%",rectX-10,newPerchange+620);  
          pop = row.getInt("2018 Population");
          String city = row.getString("Name");    
          x=x+79;
          textSize(10);
          fill(0);
          text(city ,x,y);
          line(100, 625, 900, 625);
          line(100, 625, 100, 25);    
      }
    GS1Count+=1;
  }
  }
    if (gameState == 4) {
      if (GS1Count==4){
        background(200);
        textSize(20);
        text("Restart Program to See Previous Graphs",600,100);
        x=50;
        rectX=50;
        textSize(10);
        text("2018 Density Squared Kilometer",10,10);
        for (TableRow row : table.rows()) {
          pop = row.getInt("2018 Density Squared Kilometer");               
          int newpop=pop/25;
          newpop=newpop*-1;
          rectX=rectX+80;
          rect(rectX,rectY, 20,newpop);
          String stringPop=str(pop);
          text(stringPop+" sqkm",rectX-13,newpop+620);        
          pop = row.getInt("2018 Population");
          String city = row.getString("Name");
          textSize(10);
          x=x+79;
          fill(0);
          text(city ,x,y);
          line(100, 625, 900, 625);
          line(100, 625, 100, 25);
      }
    GS1Count+=1;
  }
  }  
}
   
void keyPressed(){
    if (key == ENTER || key == RETURN){
        gameState +=1;
      
      }
  }
  
  
  
  