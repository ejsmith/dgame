part of dgame;

class GameInput {
  final Set<int> _downKeys = new Set<int>();
  final Set<int> _justPressedKeys = new Set<int>();
  
  GameInput() {
    onKeyDown.listen((e) {
      _downKeys.add(e.keyCode);
      _justPressedKeys.add(e.keyCode);
    });

    onKeyUp.listen((e) => _downKeys.remove(e.keyCode));
  }
  
  Point click;
  Point mouse;
  bool mouseDown = false;
  Game game;
  bool isKeyDown(int keyCode) => _downKeys.contains(keyCode);
  bool isKeyJustPressed(int keyCode) => _justPressedKeys.contains(keyCode);
  
  void start() {}
  void reset() {
    click = null;
    _justPressedKeys.clear();
  }
  
  final EventStream<GameKeyboardEvent> keyDownEventStream = new EventStream<GameKeyboardEvent>();
  Stream<GameKeyboardEvent> get onKeyDown => keyDownEventStream.stream;
  
  final EventStream<GameKeyboardEvent> keyUpEventStream = new EventStream<GameKeyboardEvent>();
  Stream<GameKeyboardEvent> get onKeyUp => keyUpEventStream.stream;
}

class GameKeyboardEvent {
  GameKeyboardEvent(this.keyCode, this.altKey, this.ctrlKey, this.shiftKey);
  
  int keyCode;
  bool altKey;
  bool ctrlKey;
  bool shiftKey;
}
