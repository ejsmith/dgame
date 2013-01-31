part of dgame;

class GameEntity<G extends Game> {
  G game;
  num _x = 0;
  num _y = 0;
  num _width = 1;
  num _height = 1;
  bool isHighlighted = false;
  bool soundReady = false;
  String id;
  String groupId;
  Rectangle box;
  Rectangle previousBox;
  bool _removeFromGame = false;
  num radius;
  Momentum momentum;
  bool enabled = true;
  
  // UI attributes
  num opacity = 1;
  String color = "255, 255, 255";
  bool fill = true;
  var sprite;
  
  GameEntity(G this.game) {
    momentum = new Momentum();
  }
  
  GameEntity.withPosition(G this.game, num x, num y, [num width = 1, num height = 1, String this.id, String this.groupId]) {
    momentum = new Momentum();
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    if (this.id == null || this.id.length == 0)
      this.id = this.hashCode.toString();
  }
  
  void update() {
    if (previousBox == null)
      previousBox = new Rectangle.clone(box);
    else
      previousBox.updateFrom(box);
    
    // if not enabled, do not apply momentum.
    if (!enabled)
      return;
    
    momentum.update(game.clockTick);
    x += momentum.xVel * game.clockTick;
    y += momentum.yVel * game.clockTick;
    updateBox();
  }
  
  num get x => _x;
  void set x(num value) {
    _x = value;
    updateBox();
  }
  
  num get y => _y;
  void set y(num value) {
    _y = value;
    updateBox();
  }
  
  num get width => _width;
  void set width(num value) {
    _width = value;
    updateBox();
  }
  
  num get height => _height;
  void set height(num value) {
    _height = value;
    updateBox();
  }
  
  void updateBox() {
    if (box == null)
      box = new Rectangle(0, 0, 0, 0);
    
    box.left = x - (width / 2);
    box.top = y - (height / 2);
    box.right = box.left + width;
    box.bottom = box.top + height;
  }
  
  void removeFromGame() {
    _removeFromGame = true;
  }
  
  bool outsideScreen() {
    return (x > game.rect.halfWidth || x < -(game.rect.halfWidth) ||
        y > game.rect.halfHeight || y < -(game.rect.halfHeight));
  }
  
  bool collidesWith(GameEntity entity) {
    // TODO: Check for radius to see if collision should be circular
        
    if (!entity.enabled)
      return false;
        
    return entity.box.intersectsWith(box);
  }
}
