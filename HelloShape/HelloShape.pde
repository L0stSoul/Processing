/*
 * Controls:
 * s - save to output folder
 * backspace - clear
 * m - multiple shape mode
 * 1,2 - colors
 */

import java.util.*;

String projectName = "HelloShape";
boolean multipleEnable = false;

void setup() {
  
  size(800, 800);
  smooth();
  noFill();
  background(0);
  colorMode(RGB);
  strokeWeight(2);
  stroke(255, 10);
  
}

void draw() {
  
  if (!mousePressed) return;
  
  float radius = mouseX - width/2;
  pushMatrix();
  translate(width/2, height/2);  
  drawMe(radius);
  popMatrix();

  if (!multipleEnable) return;

  pushMatrix();
  translate(width/4, height/2);  
  drawMe(radius / 2);
  popMatrix();
  pushMatrix();
  translate(3 * width/4, height/2);  
  drawMe(radius / 2);
  popMatrix();
  pushMatrix();
  translate(width/2, height/4);  
  drawMe(radius / 2);
  popMatrix();
  pushMatrix();
  translate(width/2, 3 * height/4);  
  drawMe(radius / 2);
  popMatrix();
  
}

void drawMe(float radius) {
  
  int cr = (int) map(mouseY, 0, height, 3, 10);
  float angle = TWO_PI/cr;
  
  beginShape();
  
  for ( int i = 0; i <= cr; ++i) {
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;

    vertex(x, y);
  }
  
  endShape();
  
}

void keyReleased() {
  
  if (key == 's' || key == 'S') save("../output/" + projectName + "/"+ new Date().toString() + ".png");
  if (key == 'm' || key == 'M') multipleEnable = !multipleEnable;
  if (key == BACKSPACE) background(0);
  
  if (key == '1') stroke(255, 10);
  if (key == '2') stroke(209, 197, 6, 10);
  if (key == '3') stroke(98, 45, 124, 10);
  
}

String timestamp() {
  
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
  
}

