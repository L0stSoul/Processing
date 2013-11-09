import peasy.*;
import toxi.geom.*;
import toxi.processing.*;

PeasyCam cam;
ToxiclibsSupport g;

String projectName = "Brainy Agents";
boolean needSave = false;

Vec3D topLeft;
Vec3D topRight;
Vec3D bottomLeft;
Vec3D bottomRight;

Line3D top;
Line3D right;
Line3D bottom;
Line3D left;

void setup() {

  size(800,800, P3D);
  frameRate(24);
  cam = new PeasyCam(this, 1000);

  g = new ToxiclibsSupport(this);
  
  topLeft = new Vec3D(-fieldWidth, -fieldHeight, 0);
  topRight = new Vec3D(fieldWidth, -fieldHeight, 0);
  bottomLeft = new Vec3D(-fieldWidth, fieldHeight, 0);
  bottomRight = new Vec3D(fieldWidth, fieldHeight, 0);
  
  top = new Line3D(new Vec3D(-fieldWidth - 10, -fieldHeight, 0), new Vec3D(fieldWidth + 10, -fieldHeight, 0));
  right = new Line3D( new Vec3D(fieldWidth, -fieldHeight - 10, 0), new Vec3D(fieldWidth, fieldHeight + 10, 0));
  bottom = new Line3D(new Vec3D(-fieldWidth - 10, fieldHeight, 0), new Vec3D(fieldWidth + 10, fieldHeight, 0));
  left = new Line3D(new Vec3D(-fieldWidth, fieldHeight + 10, 0), new Vec3D(-fieldWidth, -fieldHeight - 10, 0));
  
  smooth();
  
  st();

}

void st() {
  walkers = new Walker[maxWalkers];
  for(int i = 0; i < maxWalkers; ++i) {
      walkers[i] = new Walker(new Vec3D(0,0, 0));
  }
  
  for(int i = 0; i < maxWalkers; ++i) {
      Walker walker = walkers[i]; 
      while(walker.len < maxSteps) {
          walker.walk();
      }
  }
}

void draw() {
    PGraphics hiRes = null;
    if(needSave == true) {
      hiRes = saveHiResBegin(2);
    }
   
    background(255);
    
    strokeWeight(5);
    stroke(0);
    /*g.line(top); 
    g.line(right);
    g.line(bottom);
    g.line(left); 
    strokeWeight(1);
    */
    
    for(Walker walker : walkers ) {
      walker.drawPath();   
    }

    if(needSave == true) {
      needSave = false;
      saveHiResEnd(hiRes);
    }
    
}


