public class Player {
  PVector position;
  float ray, diameter, vMovement;
  ArrayList<Projectile> shots;
  boolean _left, _right, _down, _up, _shot;

  public Player(float x, float y, float ray) {
    position = new PVector(x, y);
    this.ray = ray;
    diameter = 2 * ray;
    vMovement = 10;
    shots = new ArrayList<Projectile>();
    _left = _right = _down = _up = _shot = false;
  }

  void DrawTarget(){
    fill(255);
    ellipse(mouseX, mouseY, 10, 10);
  }
  
  void draw() {
    if (keyPressed) {
      if (keyCode == UP) _up = true;
      if (keyCode == DOWN) _down = true; 
      if (keyCode == LEFT) _left = true; 
      if (keyCode == RIGHT) _right = true;
      if (key == ' ') _shot = true;
    }else {
      if (keyCode == UP) _up = false;
      if (keyCode == DOWN) _down = false; 
      if (keyCode == LEFT) _left = false; 
      if (keyCode == RIGHT) _right = false;
      if (key == ' ') _shot = false;
    }
        
    if(_up) position.y -= vMovement;
    if(_down) position.y += vMovement;
    if(_left) position.x -= vMovement;
    if(_right) position.x += vMovement;
    if(_shot) shots.add(new Projectile(position,new PVector(mouseX, mouseY)));
    
    noStroke();
    fill(0, 255, 0);
    ellipse(position.x, position.y, diameter, diameter);
    DrawTarget();
    for(int i = 0; i < shots.size();i++) shots.get(i).draw();
  }
}
