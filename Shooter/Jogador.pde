public class Jogador{
  PVector posicao;
  float raio;
  float diametro;
  float vMovimento = 5;
  ArrayList<Projetil> tiros; 
  boolean _up, _down, _right, _left, _shot;
  
  public Jogador(float x, float y, float raio){
    posicao = new PVector(x,y);
    this.raio = raio;
    this.diametro = 2 * raio;
    tiros = new ArrayList<Projetil>();
    _up = _down = _right = _left = _shot;
  }
    
  void drawAlvo(){
    fill(255);
    ellipse(mouseX,mouseY,5,5);
  }
  
  public void draw(){
    if(keyPressed){
      if(keyCode == UP) _up = true;
      if(keyCode == DOWN) _down = true;
      if(keyCode == RIGHT) _right = true;
      if(keyCode == LEFT) _left = true;
      if(key == ' ') _shot = true;
    }else{
      if(keyCode == UP) _up = false;
      if(keyCode == DOWN) _down = false;
      if(keyCode == RIGHT) _right = false;
      if(keyCode == LEFT) _left = false;
      if(key == ' ') _shot = false;
    }
    
    if(_up) posicao.y -= vMovimento;
    if(_down) posicao.y += vMovimento;
    if(_right) posicao.x += vMovimento;
    if(_left) posicao.x -= vMovimento;
    if(_shot) tiros.add(new Projetil(new PVector(posicao.x, posicao.y), new PVector(mouseX,mouseY)));
    
    noStroke();
    fill(0,255,0);
    ellipse(posicao.x, posicao.y, diametro, diametro);
    drawAlvo();
    for(int i = 0; i < tiros.size(); i++)
      tiros.get(i).draw();
    
  }
}
