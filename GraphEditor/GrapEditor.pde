ArrayList<Cell> Nodes;
ArrayList<Edge> Edges;
String renderText = "Insira um comando";
Cmds _cmd = Cmds.NULL;

Cell f = null, s = null;

void setup() {
  size(800, 600);
  Nodes = new ArrayList<Cell>();
  Edges = new ArrayList<Edge>();
}

void drawText() {
  fill(255);
  textSize(12);
  text(renderText, 10, height-10);
}

Cell closestNode(PVector p) {
  for (Cell c : Nodes)
    if (PVector.dist(c.position, p) < c.size/2) return c;
  return null;
}

Cell getMinWeight(ArrayList<Cell> l) {
  float min = Float.MAX_VALUE;
  Cell result = null;
  for (Cell c : l)
    if (c.weight < min) {
      min = c.weight;
      result = c;
    }
  return result;
}

void Dijkstra() {
  ArrayList<Cell> nonExplored = new ArrayList<Cell>();
  Cell current = null;

  for (Cell c : Nodes) {
    c.weight = Float.MAX_VALUE/2;
    c.parent = null;
    c.c = color(255);
    nonExplored.add(c);
  }

  f.weight = 0;
  f.parent = null;

  long lastTime = 0;
  long delay = 500;

  while (!nonExplored.isEmpty ()) {

    //print(millis());
    if (millis() > lastTime + delay) {
      println(millis());
      lastTime = millis();
      //if(millis() < lastTime + delay) return;
      current = getMinWeight(nonExplored);
      nonExplored.remove(current);
      current.c = color(255, 255, 0);


      //lastTime = millis();

      for (Cell c : current.neighbors) {
        float _weight = current.weight + PVector.dist(current.position, c.position);
        if (_weight < c.weight) {
          c.weight = _weight;
          c.parent = current;
        }
      }
      redraw();
    }
  }//end while
  
  f = null;
  
}

void mousePressed() {
  switch(_cmd) {
  case CREATE:
    Nodes.add(new Cell(mouseX, mouseY));  
    break;

  case CONNECT:
    if (f == null) f = closestNode(new PVector(mouseX, mouseY));
    if (f == null) return;
    f.c = color(0, 255, 0);
    renderText = "Click in the second Node to be created";

    if (s == null) {
      s = closestNode(new PVector(mouseX, mouseY));
      if (s == f) s = null;
    }
    if (s == null) return;
    s.c = color(255, 255, 0);
    Edges.add(new Edge(f.position, s.position));
    f.neighbors.add(s);
    s.neighbors.add(f);
    f.c = s.c = color(255);
    f = null;
    s = null;
    renderText = "Click in the first Node to be Connected";
    break;
  case DIJKSTRA:
    if (f == null) f = closestNode(new PVector(mouseX, mouseY));
    if (f == null) return;
    f.c = color(0, 255, 0);

    thread("Dijkstra");
    //f = null;

    break;
  }
}

void keyPressed() {
  switch(key) {
  case 'i': 
    _cmd = Cmds.CREATE;
    renderText = "Click to create a Node";
    break;
  case 'c':
    _cmd = Cmds.CONNECT;
    renderText = "Click in the first Node to be Connected";
    break;
  case 'd':
    _cmd = Cmds.DIJKSTRA;
    renderText = "Click in the source Node";
  }
}

void draw() {
  background(0);
  drawText();
  for (Cell c : Nodes) if (c!= null)c.draw();
  for (Edge c : Edges) if (c!= null)c.draw();
}
