part of dgame;

class GameRenderer<G extends Game> {
  G _game;
  MutableRectangle rect;
  
  GameRenderer();
  
  GameEntityRenderer getRenderer(GameEntity e) {
    return null;
  }
  
  G get game => _game;
  set game(G value) {
    _game = value;
    init();
  }
  
  void init() {}
  
  void render() {}
}
