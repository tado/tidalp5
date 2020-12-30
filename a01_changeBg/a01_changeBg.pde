import oscP5.*;
import netP5.*;

OscP5 osc;
color bgColor = color(0, 0, 0);

void setup(){
  size(1280, 720);
  osc = new OscP5(this, 2020);
}

void draw(){
  background(bgColor);
}

void oscEvent(OscMessage m) {
  bgColor = color(random(255), random(255), random(255));
}
