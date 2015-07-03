Player p1;
Enemy e;

void setup(){
  size(800,600);
  background(0);
  p1 = new Player(width/2, height/2, 50);
  e = new Enemy(random(0, width), random(0,height), random(10,50));
}

void draw(){
  background(0);
  p1.draw();
  e.draw();
  if(e.isAlive())p1.collidedShotEnemy(e);
}
