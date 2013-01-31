part of dgame;

typedef void LoopCallback();

class GameLoop {
  start(LoopCallback callback) {
    new Timer.repeating(50, (t) => callback());
  }
}
