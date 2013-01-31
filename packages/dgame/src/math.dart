part of dgame;

double round(double value, [int decimals = 2]) {
  int o = Math.pow(10, decimals); 
  return (value * o).round() / o;
}

num random([num min = 0, num max = 1, bool wholeNumbers = false]) {
  var rng = new Math.Random();
  num value = min + (rng.nextDouble() * (max - min));
  
  if (wholeNumbers)
    value = value.round();
  
  return value;
}
