part of dgame;

class Vector {
  num x;
  num y;
  
  Vector(this.x, this.y);
  Vector.clone(Vector vect) : this(vect.x, vect.y);
  
  void updateFrom(Vector vect) {
    x = vect.x;
    y = vect.y;
  }
}
