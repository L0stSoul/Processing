import java.util.*;

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
