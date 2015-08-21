import processing.serial.*;

float f = 0;
float mapped = 0;
float sun = 0, moon = 0;
float min = 1023, max = 0;

void setup(){
  noStroke();
  size(displayWidth, displayHeight);
  Serial myPort = new Serial(this,"COM5", 9600);
  myPort.bufferUntil('\n');
}

boolean sketchFullScreen() {
  return true;
}

void draw(){
  background(0,255-mapped-50,255-mapped);
  
  if(f < 512){
    fill(255,255,0);
    ellipse(200,sun, 200,200);
  }
  else{
    fill(255);
    ellipse(200,height+250- moon, 200,200);
  }
}

void serialEvent(Serial s){
  String str = s.readStringUntil('\n');
  str = trim(str);
  f = parseInt(str);
  if(f < min) min = f;
  else if(f > max) max = f;
  mapped = map(f, min, max, 0,255);
  sun = map(f,min,max/2, 150, height+100);
  moon = map(f,max/2,max, 150, height+100);
}
