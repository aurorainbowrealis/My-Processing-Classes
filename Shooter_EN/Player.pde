public class Player {
  PVector position;
  float ray, diameter, vMovement;
  ArrayList<Projectile> shots;
  boolean _left, _right, _down, _up, _shot;
  int aMunition;
  float interval, lastShot;

  public Player(float x, float y, float ray) {
    position = new PVector(x, y);
    this.ray = ray;
    diameter = 2 * ray;
    vMovement = 10;
    shots = new ArrayList<Projectile>();
    _left = _right = _down = _up = _shot = false;
    aMunition = 11;
    interval = 1000;
    lastShot = 0;
  }

  void DrawTarget(){
    fill(255);
    ellipse(mouseX, mouseY, 10, 10);
  }
  
  void collidedShotEnemy(Enemy e){
      Projectile toRemove = null;
      for(Projectile p:shots){
        if(PVector.dist(p.position, e.position) <= e.ray + p.ray){
          e.health -= 10;
          toRemove = p;
        }
      }
      if(toRemove != null){
        shots.remove(toRemove);
        aMunition++;
      }
  }
  
  void draw() {
    if(mousePressed){
      if (mouseButton == LEFT) _shot = true;
    }else{
      if (mouseButton == LEFT) _shot = false;
    }
    
    if (keyPressed) {
      if (keyCode == UP) _up = true;
      if (keyCode == DOWN) _down = true; 
      if (keyCode == LEFT) _left = true; 
      if (keyCode == RIGHT) _right = true;
    }else {
      if (keyCode == UP) _up = false;
      if (keyCode == DOWN) _down = false; 
      if (keyCode == LEFT) _left = false; 
      if (keyCode == RIGHT) _right = false;
    }
        
    if(_up) position.y -= vMovement;
    if(_down) position.y += vMovement;
    if(_left) position.x -= vMovement;
    if(_right) position.x += vMovement;
    if(_shot && aMunition > 0 && millis() > lastShot + interval){
      shots.add(new Projectile(position,new PVector(mouseX, mouseY)));
      aMunition--;
      lastShot = millis();
    }
    
    noStroke();
    fill(0, 255, 0);
    ellipse(position.x, position.y, diameter, diameter);
    DrawTarget();
    for(Projectile p:shots) p.draw();
  }
}
