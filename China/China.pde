import peasy.*;
import toxi.geom.*;
import toxi.processing.*;

PeasyCam cam;

ArrayList<Walker> walkers;

int maxSteps = 300;
int maxWalkers = 20;
int walkerSize = 30;
int walkerDistance = 20;

boolean needSave = false;

void setup() {
  
  size(800,800, P3D);
  frameRate(24);
  cam = new PeasyCam(this, 1000);

  smooth();
  uiSetup();
  start();

}

void start() {
  
  walkers = new ArrayList<Walker>();
  for(int i = 0; i < maxWalkers; ++i) {
      walkers.add(new Walker(new Vec3D(0,0,0), walkerDistance, walkerSize, (int)random(16)));
  }
  
  for(int i = 0; i < maxSteps; ++i) {
    for(Walker walker : walkers ) {
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
    for(Walker walker : walkers ) {
      walker.drawPath();   
    }

    if(needSave == true) {
      needSave = false;
      saveHiResEnd(hiRes);
    }
    
}


