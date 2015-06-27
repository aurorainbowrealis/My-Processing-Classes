public class Bola{
  public PVector posicao;
  public PVector velocidade;
  public float raio;
  public float diametro;
  
  private Bola(){}
  public Bola(float x, float y, float raio){
    posicao = new PVector(x,y);
    velocidade = new PVector(5,5);
    this.raio = raio;
    this.diametro = 2*raio;
  }
  
  public void draw(){
    noStroke();
    fill(0,255,0);
    ellipse(posicao.x, posicao.y, diametro, diametro);
    posicao.add(velocidade);
    
    if(posicao.y+raio >= height || posicao.y-raio < 0) velocidade.y *= -1;
    if(posicao.x+raio >= width || posicao.x-raio < 0) velocidade.x *= -1;
  }
}

