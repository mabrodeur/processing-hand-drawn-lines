/**
* Project : hand-drawn-lines-processing
* Author : marcantoinebrodeur
* Version : 1.0.0
* Date : 12-11-2014
* Hand drawn line simulation in processing 
*/

import peasy.*;

PeasyCam cam;

ArrayList<HandDrawnLine> linesArray = new ArrayList<HandDrawnLine>();

float offNoise;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  for (int i = 0; i < 50; ++i) {
    linesArray.add(new HandDrawnLine(random(50,2*width), random(-PI,PI), random(-PI,PI), random(-PI,PI), int(random(3,8)), color(0,0,0)));
  }

}

void draw() {
  background(#e8deca);
  smooth();
 
  pushMatrix();
    // Camera wiggle
    rotate(noise(offNoise));

    // Draw the lines
    for (HandDrawnLine l : linesArray) {
      l.draw();
    }
  popMatrix();

  offNoise += random(-0.02,0.02);
}

boolean sketchFullScreen(){
  return true;
}
