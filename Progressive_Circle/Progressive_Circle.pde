PVector center;
float numPoints = 3, ray = 200;
float initTime = 0;

void setup(){
  size(800,600);
  center = new PVector(width/2, height/2);
  
}

void draw(){
  background(255);
  float step = 2*PI/numPoints; 
  
  float _x = center.x + ray * cos(0);
  float _y = center.y - ray * sin(0);
  
  for(float t = step; t <= 2.001*PI; t += step){
    float x = center.x + ray * cos(t);
    float y = center.y - ray * sin(t);
    line(_x,_y,x,y);
    _x = x;_y = y;
  }
  endShape(CLOSE);
  //print("Milis:",millis(),"init", initTime);
  if(numPoints < 360 && millis() > initTime+250){
    numPoints++;
    initTime = millis();
  }
}
