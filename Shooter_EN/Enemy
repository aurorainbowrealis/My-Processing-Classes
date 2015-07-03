class Enemy{
  PVector position;
  float diameter, ray;
  int health;
  
  Enemy(float x, float y){
    position = new PVector(x,y);
    ray = 100;
    diameter = 2*ray;
    health = 100;
  }
  
  void draw(){
    if(health <= 0) return;
    fill(255);
    ellipse(position.x, position.y, diameter, diameter);
  }
}
