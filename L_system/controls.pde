import java.awt.Frame;
import java.awt.BorderLayout;
import java.util.*;
import controlP5.*;

ControlP5 cp5;
ControlFrame cf;

String projectName = "L-system";
boolean needSave = false;

  
void uiSetup() {
  cp5 = new ControlP5(this);
  
  Frame f = new Frame("controls");
  cf = new ControlFrame(this);
  f.add(cf);
  cf.init();
  f.setTitle("controls");
  f.setSize(cf.w, cf.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
}

void uiDraw() {

  if(!needSave)  return;
  
  save("../output/" + projectName + "/"+ new Date().toString() + ".png");
  needSave = false;

}

public class ControlFrame extends PApplet {

  int w = 620;
  int h = 400;
  int abc = 100;
  int sliderPosition = 0;
  int increment = 30;
  int groupIncrement = 40;
  
  public void setup() {
    background(255, 0, 0);
    size(w, h);
    frameRate(25);
    
    cp5 = new ControlP5(this);
    
    addSlider("gen", 20, true);
    
    addSlider("aAngleX", true);
    addSlider("aAngleY");
    addSlider("aAngleZ");
    
    addSlider("bAngleX", true);
    addSlider("bAngleY");
    addSlider("bAngleZ");
    
    addSlider("cAngleX", true);
    addSlider("cAngleY");
    addSlider("cAngleZ");
    
    cp5.addButton("takeScreenshort")
     .setPosition(10,10)
     .setSize(200,19);

}


public void takeScreenshort(int val) {
  needSave = true;
}


  public void addSlider(String name, boolean f) {
    addSlider(name, 360, f);
  }
  
  public void addSlider(String name) {
    addSlider(name, 360, false);
  }
  
  public void addSlider(String name, int  max, boolean isFirstInGroup) {
    
    sliderPosition += isFirstInGroup ? groupIncrement : increment;
    cp5.addSlider(name)
      .plugTo(parent, name)
      .setRange(0, max)
      .setPosition(10, sliderPosition)
      .setWidth(510)
      .setHeight(20);
  }
  
  public void draw() {
      background(abc);
  }
  
  private ControlFrame() {
  }

  public ControlFrame(Object theParent) {
    parent = theParent;
  }


  public ControlP5 control() {
    return cp5;
  }
  
  
  ControlP5 cp5;

  Object parent;
  
}

