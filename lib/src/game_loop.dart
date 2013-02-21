part of dgame;

typedef void LoopCallback();

class GameLoop {
  start(LoopCallback callback) {
    new Timer.repeating(const Duration(milliseconds: 50), (t) => callback());
  }
}
