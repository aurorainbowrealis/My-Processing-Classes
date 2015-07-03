public class Projectile{
  PVector position;
  float maxSpeed;
  PVector target;
  PVector velocity;
  float diameter, ray;
  
  Projectile(PVector startPos, PVector target){
    this.position = new PVector(startPos.x, startPos.y);//O NOSSO PROBLEMA ESTÁ AQUI
    this.target = target;
    maxSpeed = 2;
    velocity = new PVector(target.x - startPos.x, target.y - startPos.y);
    velocity.limit(maxSpeed);
    ray = 3.5;
    diameter = 2*ray;
  }
  
  void draw(){
    fill(255,255,0);
    ellipse(position.x, position.y, diameter, diameter);
    position.add(velocity);
  }
}
