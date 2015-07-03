class Enemy{
  PVector position;
  float ray, diameter, health;
  Enemy(float x, float y, float ray){
    position = new PVector(x,y);
    this.ray = ray;
    this.diameter = 2 * ray; 
    health = 100;
  }
  
  boolean isAlive(){
    return health > 0;
  }
  
  void draw(){
    if(!isAlive()) return;
    fill(255);
    ellipse(position.x, position.y, diameter, diameter);
  }
}
