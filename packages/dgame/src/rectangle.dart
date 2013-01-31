part of dgame;

class Rectangle {
  num top;
  num left;
  num right;
  num bottom;
  
  Rectangle(this.top, this.left, this.right, this.bottom);
  Rectangle.clone(Rectangle rect) : this(rect.top, rect.left, rect.right, rect.bottom);
  Rectangle.withSize(num width, num height) {
    top = 0;
    bottom = height;
    left = 0;
    right = width;
  }
  
  void updateFrom(Rectangle rect) {
    top = rect.top;
    left = rect.left;
    right = rect.right;
    bottom = rect.bottom;
  }
  
  bool intersectsWith(Rectangle other) {
    return Rectangle.intersect(this, other);
  }
  
  bool contains(Vector point) {
    if (point == null)
      return false;
    
    return point.x >= left && point.x <= right
        && point.y >= top && point.y <= bottom;
  }
  
  num get width => right - left;
  num get height => bottom - top;
  num get x => left;
  num get y => top;
  num get halfWidth => width / 2;
  num get halfHeight => height / 2;
  
  static bool intersect(Rectangle r1, Rectangle r2) {
    return !(r1.left > r2.right || 
        r1.right < r2.left || 
        r1.top > r2.bottom ||
        r1.bottom < r2.top);
  }
}
