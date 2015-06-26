class Projetil{
  PVector pInicial, direcao, velocidade;
  float diametro = 14, vMaxima = 10;
  
  public Projetil(PVector pInicial, PVector direcao){
    this.pInicial = pInicial;
    this.direcao = direcao;
    velocidade = new PVector(0.0,0.0);
    direcao.sub(pInicial);
    direcao.limit(vMaxima);
  }

  void draw(){
    fill(255,255,0);
    PVector aux = new PVector(velocidade.x, velocidade.y);
    velocidade.add(direcao);
    velocidade.sub(aux);
    pInicial.add(velocidade);
    ellipse(pInicial.x, pInicial.y, diametro, diametro);
  }
}
