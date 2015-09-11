ArrayList<Element> e;
ArrayList<Element> toRemove;
PVector pos;
float speed = 5;
boolean _up = false, _down = false;
long delay = 100;
long lastAction = 0;

void setup(){
  noStroke();
  size(displayWidth,displayHeight);
  pos = new PVector(20, height/2);
  e = new ArrayList<Element>();
}

boolean sketchFullScreen() {
  return true;
}

void draw(){
  background(0);
  /*if(millis() > delay + lastAction){
    
    lastAction = millis();
  }*/
  e.add(new Element());
  toRemove = new ArrayList<Element>();
  for(Element l:e){
    l.draw();
    if(l.pos.x+l.s < 0) toRemove.add(l);
  }
  for(Element l:toRemove) e.remove(l);
  if(keyPressed){
    switch(keyCode){
      case UP:
        _up = true;
      break;
      case DOWN:
        _down = true;
      break;
    }
  }else{
    switch(keyCode){
      case UP:
        _up = false;
      break;
      case DOWN:
        _down = false;
      break;
    }
  }
  
  if(_up && pos.y > 0) pos.y -= speed;
  if(_down && pos.y+50 < height) pos.y += speed;

  fill(0,255,0);
  rect(pos.x,pos.y,100,30);
}

