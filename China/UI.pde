import java.awt.Frame;
import java.awt.BorderLayout;
import java.util.*;
import controlP5.*;

ControlP5 cp5;
ControlFrame cf;
  
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

public class ControlFrame extends PApplet {

  int w = 620;
  int h = 200;
  int abc = 100;
  int sliderPosition = 0;
  int increment = 30;
  int groupIncrement = 40;
  
  public void setup() {
    background(255, 0, 0);
    size(w, h);
    frameRate(25);
    
    cp5 = new ControlP5(this);
    
    addSlider("maxSteps", 300, maxSteps, true);
    addSlider("maxWalkers", 30, maxWalkers, false);
    
    addSlider("walkerSize", walkerSize, true);
    addSlider("walkerDistance", walkerDistance);

}

  public void addSlider(String name, int defaultValue, boolean f) {
    addSlider(name, 250, defaultValue, f);
  }
  
  public void addSlider(String name, int defaultValue) {
    addSlider(name, 250, defaultValue, false);
  }
  
  public void addSlider(String name, int  max, int defaultValue, boolean isFirstInGroup) {
    
    sliderPosition += isFirstInGroup ? groupIncrement : increment;
    cp5.addSlider(name)
      .plugTo(parent, name)
      .setRange(0, max)
      .setPosition(10, sliderPosition)
      .setWidth(510)
      .setValue(defaultValue)
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
  
};

void controlEvent(ControlEvent theEvent) {
  start();
}
