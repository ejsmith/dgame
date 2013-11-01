part of dgame;

double round(double value, [int decimals = 2]) {
  int o = pow(10, decimals); 
  return (value * o).round() / o;
}

num random([num min = 0, num max = 1, bool wholeNumbers = false]) {
  var rng = new Random();
  num value = min + (rng.nextDouble() * (max - min));
  
  if (wholeNumbers)
    value = value.round();
  
  return value;
}

class DRectangle extends MutableRectangle {
  DRectangle([num left = 0, num top = 0, num width = 0, num height = 0]) : super(left, top, width, height);
  
  factory DRectangle.clone(Rectangle rect) {
    return new DRectangle(rect.left, rect.top, rect.width, rect.height);
  }
  
  void updateFrom(Rectangle rect) {
    top = rect.top;
    left = rect.left;
    width = rect.width;
    height = rect.height;
  }
  
  num get halfWidth => width / 2;
  num get halfHeight => height / 2;
  
  num get centerX => left + halfWidth;
  set centerX(num x) => left = x  - (width / 2);
  
  num get centerY => top + halfHeight;
  set centerY(num y) => top = y - (height / 2);
  
  void setCenter(Point center) {
    centerX = center.x;
    centerY = center.y;
  }
  
  Point getCenter() => new Point(top + halfWidth, left + halfHeight);
}