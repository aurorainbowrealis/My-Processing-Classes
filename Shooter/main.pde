Jogador j1;

void setup(){
  size(800,600);
  background(0);
  j1 = new Jogador(width/2, height/2, 50);
}

void draw(){
  background(0);
  j1.draw();
}

void keyPressed(){
  j1.keyPressed();
}
