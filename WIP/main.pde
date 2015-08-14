Cell[][] grid;
float res = 10;

void setup(){
  size(800,600);
  noStroke();
  grid = new Cell[(int)(width/res)][(int)(height/res)];
  
  for(int i = 0; i < width/res; i++){
    for(int j = 0; j < height/res; j++){
      grid[i][j] = new Cell(res, i*res,j*res);
    }
  }
}

void drawLoc(){
}

void draw(){
  
  for(Cell[] c:grid)
    for(Cell d:c)d.draw();
  color _temp = grid[(int)(mouseX/res)][(int)(mouseY/res)].c;
  grid[(int)(mouseX/res)][(int)(mouseY/res)].c = color(255);
  grid[(int)(mouseX/res)][(int)(mouseY/res)].draw();
  grid[(int)(mouseX/res)][(int)(mouseY/res)].c = _temp;
  
}
