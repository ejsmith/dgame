part of dgame;

class GameTimer {
  num gameTime = 0;
  static final num MAX_STEP = 0.05;
  num wallLastTimestamp = 0;
  num fps = 0;
  num fpsSampleRate = 60;
  bool timeDecrease = false;
  
  num tick() {
    num wallCurrent = new Date.now().millisecondsSinceEpoch;
    num wallDelta = (wallCurrent - wallLastTimestamp) / 1000;
    wallLastTimestamp = wallCurrent;
    num currentFps = 1 / wallDelta;
    fps += (currentFps - fps) / fpsSampleRate;
    
    num gameDelta = Math.min(wallDelta, MAX_STEP);
    
    if (!timeDecrease)
      gameTime += gameDelta;
    else
      gameTime -= gameDelta;
    
    return gameDelta;
  }
}