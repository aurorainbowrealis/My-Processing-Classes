class Element{
  PVector pos;
  color c;
  float s;
  float speed;
  float form;
  Element(){
    pos = new PVector(width, random(height));
    c = color(random(100,255),random(100,255),random(100,255));
    s = random(10, 100);
    speed = random(1,50);
    form = (int)random(0,1000);
  }
  
  void draw(){
    fill(c);
    if(form %2 == 0)rect(pos.x,pos.y,s,s);
    else ellipse(pos.x,pos.y,s,s);
    pos.x -= speed;
  }
}
