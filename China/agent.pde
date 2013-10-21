
int XUP = 0,
    YUP = 1,
    ZUP = 2,
    XDOWN = 3,
    YDOWN = 4,
    ZDOWN = 5;
    
class Walker {

  ArrayList<Vec3D> points;
  int stepSize;
  int diameter;
  int type;
  
  Walker(Vec3D _pos, int _stepSize, int _diameter, int _type) {
    points = new ArrayList<Vec3D>();
    points.add(_pos);
    stepSize = _stepSize;
    diameter = _diameter;
    type = _type;  
  }
  
  void walk() {
    Vec3D pos = points.get(points.size() - 1).copy();

    int way = (int)random(7);
    if (way == XUP) pos.x += stepSize;
    else if (way == XDOWN) pos.x -= stepSize;
    else if (way == YUP) pos.y += stepSize;
    else if (way == YDOWN) pos.y -= stepSize;
    else if (way == ZUP) pos.z += stepSize;
    else if (way == ZDOWN) pos.z -= stepSize;

    points.add(pos);
  }
  
  void drawPath() {
    
    if(type == 1) {
       fill(200, 10, 10, 250);
       stroke(0, 150);
       strokeWeight(1);
    } else if (type == 2) {
       fill(255, 237, 20, 250);
       stroke(0, 150);
       strokeWeight(1);
    } else if (type == 3) {
      noFill(); 
      //fill(255, 237, 20, 200);
       stroke(0, 150);
      strokeWeight(2);
    } else {
      fill(200, 200);
      stroke(0, 150);
      strokeWeight(1);
    };
    
    for(Vec3D pos : points ) {

      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      box(diameter);
      popMatrix();
     
    }   
  }
  
}

