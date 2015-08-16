class Cell{
  float size = 10;
  PVector position;
  float offset = 10;
  color c = color(255);
  float weight = Float.MAX_VALUE/2;
  Cell parent = null;
  ArrayList<Cell> neighbors;  
  
  Cell(float x, float y){
    this.size = size;
    position = new PVector(x,y);
    neighbors = new ArrayList<Cell>();
  }
  void draw(){
    fill(c);
    ellipse(position.x,position.y,size,size);
    textSize(12);
    if(weight == Float.MAX_VALUE/2)text("inf", position.x+offset,position.y);
    else text(weight, position.x+offset,position.y);
  }
}
