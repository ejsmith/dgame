part of dgame;

typedef void LoopCallback();

class GameLoop {
  start(LoopCallback callback) {
    new Timer.periodic(const Duration(milliseconds: 50), (t) => callback());
  }
}
