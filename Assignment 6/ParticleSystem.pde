class Firework {

  ArrayList<dot> dots;    
  dot firework;
  float ColorOfFirework;

  Firework() {
    ColorOfFirework = random(255);
    firework = new dot(random(width-10), height-10, ColorOfFirework);
    dots = new ArrayList<dot>();   
  }
  
  boolean EndFirework() {
    if (firework == null && dots.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    if (firework != null) {
      firework.applyForce(grav);
      firework.update();
      firework.display();

      if (firework.boom()) {
        for (int i = 0; i < 100; i++) {
          dots.add(new dot(firework.loc, ColorOfFirework)); 
        }
        firework = null;
      }
    }

    for (int i = dots.size()-1; i >= 0; i--) {
      dot p = dots.get(i);
      p.applyForce(grav);
      p.run();
      if (p.isDoesItWork()) {
        dots.remove(i);
      }
    }
  }


  boolean DoesItWork() {
    if (dots.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}