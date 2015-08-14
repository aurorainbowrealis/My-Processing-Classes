class Cell{
  float size = 10;
  PVector position;
  color c = color(0);
  Cell(float size, float x, float y){
    this.size = size;
    position = new PVector(x,y);
  }
  void draw(){
    fill(c);
    rect(position.x,position.y,size,size);
  }
}
