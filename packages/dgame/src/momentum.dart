part of dgame;

class Momentum {
  num xVel;
  num yVel;
  num xAccel;
  num yAccel;
  num xMax;
  num yMax;
  
  Momentum([num this.xVel = 0, num this.yVel = 0, num this.xAccel, num this.yAccel, num this.xMax, num this.yMax]);
  
  void update(num clockTick) {
    if (xAccel != null && xAccel != 0 && xVel.abs() < xMax)
      if (xVel > 0)
        xVel += xAccel * clockTick;
      else
        xVel -= xAccel * clockTick;
    if (yAccel != null && yAccel != 0 && yVel.abs() < yMax)
      if (yVel > 0)
        yVel += yAccel * clockTick;
      else
        yVel -= yAccel * clockTick;
    
    if (xVel != null && xMax != null && xVel.abs() > xMax)
      xVel = xVel > 0 ? xMax : -(xMax);
    if (yVel != null && yMax != null && yVel.abs() > yMax)
      yVel = yVel > 0 ? yMax : -(yMax);
  }
}