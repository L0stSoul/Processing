import peasy.*;
import toxi.geom.*;



PeasyCam cam;
ArrayList<Stick> sticks;

int aAngleX = 30;
int aAngleY = 0;
int aAngleZ = 0;
int bAngleX = 0;
int bAngleY = 0;
int bAngleZ = 0;
int cAngleX = 0;
int cAngleY = 0;
int cAngleZ = 0;

int gen = 9;

void setup() {
  size(800,800, P3D);
  smooth();
  
  sticks = new ArrayList<Stick>();
  cam = new PeasyCam(this, 1000);
  uiSetup();
}

void draw() {
  sticks.clear();
  
  sticks.add(new Stick(
    new Vec3D(0, 0, 0), new Vec3D(20, 0, 0), gen, "A"
  ));
  
  background(255);
  
  stroke(0);
  strokeWeight(1);
  noFill();
  
  for (Stick stick: sticks) {
    stick.run();
  }
 
  uiDraw(); 
}




