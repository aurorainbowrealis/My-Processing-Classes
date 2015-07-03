Player p1;
Enemy e;
void setup(){
  size(800,600);
  background(0);
  p1 = new Player(width/2, height/2, 50);
  e = new Enemy(random(0,width), random(0,height));
}

boolean collided(){
  if(e.health <= 0) return false;
  ArrayList<Projectile> toRemove = new ArrayList<Projectile>();
  for(Projectile p:p1.shots){
    float dist = PVector.dist(e.position, p.position);
    if(dist <= e.ray + p.ray){
      toRemove.add(p);
    }
  }
  
  if(toRemove.size() > 0){
    for(Projectile p: toRemove){
      p1.shots.remove(p);
      p1.aMunition++;
    }
    return true;
  }
  return false;
}

void draw(){
  background(0);
  p1.draw();
  e.draw();
  if(collided()) e.health -= 10;
}
