import java.util.*;

String projectName = "China";

/*
 * Controls
 */

void keyPressed () {
  if (key == 's' || key == 'S') { needSave = true;}
  if (key == 'r' || key == 'R' ) { start(); }
}


/*
 * Cam checking
 */
 
float[] prevCenter;
float[] prevRotation;
double prevDistance;

boolean isCamStateChanged() {
    double distance = cam.getDistance();
    float[] rotation =  cam.getRotations();
    float[] center = cam.getLookAt();
    
    if(
      distance == prevDistance &&
      prevCenter != null &&
      prevCenter[0] == center[0] &&
      prevCenter[1] == center[1] &&
      prevCenter[2] == center[2] &&
      prevRotation != null &&
      prevRotation[0] == rotation[0] && 
      prevRotation[1] == rotation[1] && 
      prevRotation[2] == rotation[2]
    ) return false;
    
    prevDistance = distance;
    prevRotation = rotation;
    prevCenter = center;

    return true;
};
 
PGraphics saveHiResBegin(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, P3D);
  hires.scale(scaleFactor);
  beginRecord(hires);
  return hires;

}

void saveHiResEnd(PGraphics hires) {
  hires.save("../output/" + projectName + "/"+ new Date().toString() + ".png");
  endRecord();
}
