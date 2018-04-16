String title;
String buildDate;
XML[] items;
int start;
int y = 200;
int end = 10;

void setup() {
  size(1000, 1000);
  String url = "http://feeds.bbci.co.uk/news/rss.xml?edition=uk";
  XML xml = loadXML(url);
  title = xml.getChild("channel/title").getContent();
  buildDate = xml.getChild("channel/lastBuildDate").getContent();
  items = xml.getChild("channel").getChildren("item");
}

void draw() {
  fill(0);
  rect(0, 800, 1000, 200);
  start =0;
  println(items[6].getChild("title").getContent());
  fill(255);
  
  for (int i = start; i<end;i++){
    textSize(24);
    text(items[i].getChild("title").getContent(), 10, y);
    //text(items[i].getChild("description").getContent(), 40, 850);
    y += 40;
  }
  noLoop();
  
}