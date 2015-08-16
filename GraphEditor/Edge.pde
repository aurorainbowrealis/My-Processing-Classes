class Edge{
  PVector from, to;
  float weight;
  Edge(PVector from,PVector to){
    this.from = new PVector(from.x,from.y);
    this.to = new PVector(to.x,to.y);
    weight = PVector.dist(from,to);
  }
  
  void draw(){
    stroke(255);
    fill(255);
    textSize(12);
    line(from.x,from.y,to.x,to.y);
    text(weight, (from.x+to.x)/2,(from.y+to.y)/2);
    noStroke();
  }
}
