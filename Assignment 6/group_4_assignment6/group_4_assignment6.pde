
ArrayList<Firework> fireworks;

PVector grav = new PVector(0, .1);

void setup() {
  size(500, 500);
  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
}

void draw() {
  if (random(1) < 0.05) {
    fireworks.add(new Firework());
  }
  noStroke();
  rect(0,0,width-10,height-10);
  background(0);

  
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework work = fireworks.get(i);
    work.run();
    if (work.EndFirework()) {
      fireworks.remove(i);
    }
  }
  
  
  
}