Player p1;
void setup(){
  size(800,600);
  background(0);
  p1 = new Player(width/2, height/2, 50);
}

void draw(){
  background(0);
  p1.draw();
}
