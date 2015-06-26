Bola b;

void setup(){
  //Configura o Canvas
  size(1024,768);
  background(0);
  
  //Cria nova Bola ao centro
  b = new Bola(width/2, height/2, 50);
}

void draw(){
  background(0);
  //Chama função de desenho da bola
  b.draw();
}
