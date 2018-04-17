String title;
String buildDate;
XML[] items;
int start = 0;
int y = 150;
int end = 10;
String desc;
String linkURL;

Button [] titleButtons;
Button [] radioButtons;
Button nextButton;
Button backButton;

void setup() {
  background(95);
  size(1000, 700);
  String url = "http://feeds.bbci.co.uk/news/rss.xml?edition=uk";
  XML xml = loadXML(url);
  title = xml.getChild("channel/title").getContent();
  buildDate = xml.getChild("channel/lastBuildDate").getContent();
  items = xml.getChild("channel").getChildren("item");
  
  titleButtons = new Button [10];
  for (int i = 0; i<10;i++){
    titleButtons[i] = new Button(10,y-24,700,24);
    y+=40;
  }
  int Xspacing = 10;
  fill(255);
  text("Select Feed:",10,14);
  radioButtons = new Button [5];
  for (int i = 0; i<5;i++){
    radioButtons[i] = new Button(Xspacing,15,25,25);
    if (i == 0){
      fill(color(#F71B2A));
    }
    if (i == 1){
      fill(color(#EC1BF7));
    }
    if (i == 2){
      fill(color(#1BDFF7));
    }
    if (i == 3){
      fill(color(#25F71B));
    }
    if (i == 4){
      fill(color(#F7741B));
    }
    
    rect(Xspacing, 15, 25, 25);
    Xspacing+=30;
  }
  fill(0);
  ellipse(10+12.5, 15+12.5, 10, 10);
  
  fill(0);
  rect(0, 550, 1000, 150);
  
  //initalize next and back buttons
  nextButton = new Button(650,20,35,20);
  stroke(0);
  strokeWeight(3);
  fill(255);
  rect(650,20,35,20);
  fill(0);
  text("NEXT",653,32);
  backButton = new Button(600,20,35,20);
  fill(255);
  rect(600,20,35,20);
  fill(0);
  text("BACK",603,32);
  strokeWeight(1);
}

void draw() {
  textSize(24);
  fill(255);
  text(title,20,80);
  text(buildDate,20,100);
  y = 150;
  //println(items[6].getChild("title").getContent());
  fill(255);
  
  for (int i = start; i<end;i++){
    textSize(24);
    text(items[i].getChild("title").getContent(), 10, y);
    //text(items[i].getChild("description").getContent(), 40, 850);
    y += 40;
  }
  
  for (int q = 0; q<10;q++){
    if (titleButtons[q].checkHover()){
      if (q+start < items.length){
        //println(q);
        fill(0);
        rect(0, 550, 1000, 150);
        fill(255);
        desc = items[q+start].getChild("description").getContent();
        if (textWidth(desc) > 900){
          text(desc.substring(0,40), 20, 580);
          if (textWidth(desc.substring(40,desc.length())) > 900) {
            text(desc.substring(40,80), 20, 620);
            text(desc.substring(80,desc.length()), 20, 660);
          } else {
            text(desc.substring(40,desc.length()), 20, 620);
          }
        } else {
          text(desc, 20, 580);
        }
      }
    }
  } 
}

void mousePressed(){
  for (int q = 0; q<10;q++){
    if (titleButtons[q].checkPress()){
      if (q+start < items.length){
        linkURL = items[q+start].getChild("link").getContent();
        link(linkURL);
      }
    }
  }
  
  if (nextButton.checkPress()){
    if(items.length >end+10){
      start +=10;
      end +=10;
      fill(95);
      stroke(95);
      rect(0,120,1000,550-140);
    }
    else if(items.length <end+10 && items.length <start+10){
      //do nothing
    }
    else if(items.length <end+10){
      start+=10;
      end = items.length;
      fill(95);
      stroke(95);
      rect(0,120,1000,550-140);
    } 
    
  }
  
  if (backButton.checkPress()){
    if (end%10 >0){
      end-=(end%10);
      start -=10;
      fill(95);
      stroke(95);
      rect(0,120,1000,550-140);
    }
    else if(end-10 >=0 && start-10 >=0){
      start -=10;
      end -=10;
      fill(95);
      stroke(95);
      rect(0,120,1000,550-140);
    }
  }
  
  for (int q = 0; q<5;q++){
    if (radioButtons[q].checkPress()){
      start = 0;
      end = 10;
      for (int k = 0; k<5;k++){
        if (k == 0){
          fill(color(#F71B2A));
        }
        if (k == 1){
          fill(color(#EC1BF7));
        }
        if (k == 2){
          fill(color(#1BDFF7));
        }
        if (k == 3){
          fill(color(#25F71B));
        }
        if (k == 4){
          fill(color(#F7741B));
        }
        stroke(0);
        rect((30*k)+10, 15, 25, 25);
      }
      fill(0);
      stroke(0);
      ellipse((30*q)+10+12.5, 15+12.5, 10, 10);
      fill(95);
      stroke(95);
      rect(0,60,1000,550-65);
      if (q == 0){
        //BBC news home
        String url = "http://feeds.bbci.co.uk/news/rss.xml?edition=uk";
        XML xml = loadXML(url);
        title = xml.getChild("channel/title").getContent();
        buildDate = xml.getChild("channel/lastBuildDate").getContent();
        items = xml.getChild("channel").getChildren("item");
      }
      
      if (q == 1){
        //BBC news technology
        String url = "http://feeds.bbci.co.uk/news/technology/rss.xml";
        XML xml = loadXML(url);
        title = xml.getChild("channel/title").getContent();
        buildDate = xml.getChild("channel/lastBuildDate").getContent();
        items = xml.getChild("channel").getChildren("item");
      }
      
      if (q == 2){
        //BBC news buisness
        String url = "http://feeds.bbci.co.uk/news/business/rss.xml";
        XML xml = loadXML(url);
        title = xml.getChild("channel/title").getContent();
        buildDate = xml.getChild("channel/lastBuildDate").getContent();
        items = xml.getChild("channel").getChildren("item");
      }
      
      if (q == 3){
        //BBC news Africa
        String url = "http://feeds.bbci.co.uk/news/world/africa/rss.xml";
        XML xml = loadXML(url);
        title = xml.getChild("channel/title").getContent();
        buildDate = xml.getChild("channel/lastBuildDate").getContent();
        items = xml.getChild("channel").getChildren("item");
      }
      
      if (q == 4){
        //BBC news USA and Canada
        String url = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml";
        XML xml = loadXML(url);
        title = xml.getChild("channel/title").getContent();
        buildDate = xml.getChild("channel/lastBuildDate").getContent();
        items = xml.getChild("channel").getChildren("item");
      }
      
      
    }
  }
  
}
