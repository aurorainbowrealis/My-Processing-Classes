public class Bola{
  public Vetor posicao;
  public Vetor velocidade;
  public double raio;
  public double diametro;
  
  private Bola(){}
  public Bola(double x, double y, double raio){
    posicao = new Vetor(x,y);
    velocidade = new Vetor(5,5);
    this.raio = raio;
    this.diametro = 2*raio;
  }
  
  public void draw(){
    noStroke();
    fill(0,255,0);
    ellipse((float)posicao.x, (float)posicao.y, (float)diametro, (float)diametro);
    posicao = posicao.Soma(velocidade);
    
    if(posicao.y+raio >= height || posicao.y-raio < 0) velocidade.y *= -1;
    if(posicao.x+raio >= width || posicao.x-raio < 0) velocidade.x *= -1;
  }
}
