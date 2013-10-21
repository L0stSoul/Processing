class Stick
{
  
  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;
  
  int gen;
  
  String type;

  Stick(Vec3D _loc, Vec3D _vel, int _gen, String _type) {
    loc = _loc;
    oriLoc = _loc.copy();
    vel = _vel;
    gen = _gen;
    type = _type;
    
    rotate();
    move();
    spawn();
  }
  
  void createChild(String _type) {
    sticks.add(new Stick(
      loc.copy(), vel.copy(), gen, _type
    ));
  }
  
  void spawn() {
    
    if (gen <= 0) return;
    
    --gen;
     
    if(type == "A") {
      createChild("A");
      createChild("B");
    }
    
    if(type == "B") {
      createChild("C");
    }

    if(type == "C") {
      createChild("A");
    }
     
  }
  
  void run() {
    display();
  }
  
  void _rotate(int x, int y, int z) {
    vel.rotateX(radians(x));
    vel.rotateY(radians(y));
    vel.rotateZ(radians(z));
  }
  
  void rotate() {
    
    if (type == "A") _rotate(aAngleX, aAngleY, aAngleZ);
    if (type == "B") _rotate(bAngleX, bAngleY, bAngleZ);
    if (type == "C") _rotate(cAngleX, cAngleY, cAngleZ);
    
  }
  
  void move() {
    loc.addSelf(vel);
  }
  
  void display() {
    stroke(255,0, 0);
    strokeWeight(5);
    point(loc.x, loc.y, loc.z);
        
    stroke(0);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }
  
}
