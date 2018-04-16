String title;
String buildDate;
XML[] items;
int start;
int y = 150;
int end = 10;
String desc;
Button [] titleButtons;
Button nextButton;
Button backButton;

void setup() {
  size(700, 700);
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
  fill(0);
  rect(0, 550, 700, 150);
  
  //initalize start button
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
  
  start =0;
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
      //println(q);
      fill(0);
      rect(0, 550, 700, 150);
      fill(255);
      desc = items[q+start].getChild("description").getContent();
      if (textWidth(desc) > 600){
        text(desc.substring(0,40), 20, 580);
        if (textWidth(desc.substring(40,desc.length())) > 600) {
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