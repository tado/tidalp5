import oscP5.*;
import netP5.*;

OscP5 osc;
ArrayList<Note> notes = new ArrayList<Note>();
int nOrbit = 6;

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  osc = new OscP5(this, 2020);
  background(0);
  noStroke();
}

void draw() {
  fill(0, 0, 0, 16);
  rect(0, 0, width, height);  
  for (int i = 0; i < notes.size(); i++) {
    notes.get(i).draw();
  }
  notes.clear();
}

void oscEvent(OscMessage m) {
  println(m);
  int orbit = -1;
  float cycle = -1;
  for (int i = 0; i < m.typetag().length(); i++) {
    String name = m.get(i).stringValue();
    switch(name) {
    case "orbit":
      orbit = m.get(i+1).intValue();
      break;
    case "cycle":
      cycle = m.get(i+1).floatValue();
      break;
    }
    i++;
  }
  if (orbit >= 0) {
    notes.add(new Note(orbit, cycle));
  }
}

class Note {
  int orbit;
  float cycle;
  float divCycle = -1;
  float x, y;

  Note(int _orbit, float _cycle) {
    orbit = _orbit;
    cycle = _cycle;
    x = random(width);
    y = random(height);
  }

  void draw() {
    float hue = map(orbit, 0, nOrbit, 0, 360);
    divCycle = (int(cycle * 1000) - int(cycle) * 1000) / 1000.0;
    float x = map(divCycle, 0, 1, 0, width);
    float y = map(orbit, 0, nOrbit, 0, height);
    fill(hue, 60, 100);
    rect(x, y, width/32, height/nOrbit);
  }
}
