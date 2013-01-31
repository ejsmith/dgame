part of dgame;

class GameInput {
  Vector click;
  Vector mouse;
  int keyCode;
  bool mouseDown = false;
  Game game;
  void start() {}
  void reset() {
    click = null;
    keyCode = -1;
  }
}
