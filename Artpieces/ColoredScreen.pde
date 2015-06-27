int resolution = 10;
void setup(){
  size(1200,600);
  //noStroke();
  background(0);
  fill(255);
  stroke(255);
  rectMode(CENTER);
}

void draw(){
  background(0);
  for(int i = resolution/2; i < width; i+=resolution){
    for(int j = resolution/2; j < height; j+=resolution){
      fill(random(0,255),random(0,255),random(0,255));
      rect(i,j,resolution,resolution);
    }
  }
}