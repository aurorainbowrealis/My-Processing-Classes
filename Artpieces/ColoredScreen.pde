int resolution = 3; // Change this parameter to change the square size
void setup(){
  size(1200,600);
  noStroke();
  rectMode(CENTER);
}

void draw(){
  for(int i = resolution/2; i < width; i+=resolution)
    for(int j = resolution/2; j < height; j+=resolution){
      fill(random(0,255),random(0,255),random(0,255));
      rect(i,j,resolution,resolution);
    }
}