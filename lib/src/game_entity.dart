part of dgame;

class GameEntity<G extends Game> extends DRectangle {
  G game;
  bool isHighlighted = false;
  bool soundReady = false;
  String id;
  String groupId;
  DRectangle previousBox;
  bool _removeFromGame = false;
  num radius;
  Momentum momentum;
  bool enabled = true;
  bool centered = true;
  
  // UI attributes
  num opacity = 1;
  String color = "255, 255, 255";
  bool fill = true;
  var sprite;
  
  GameEntity(G this.game) {
    momentum = new Momentum();
  }
  
  GameEntity.withPosition(G this.game, num x, num y, [num width = 1, num height = 1, String this.id, String this.groupId, bool centered = true]) {
    momentum = new Momentum();
    this.centered = centered;
    this.width = width;
    this.height = height;
    if (this.centered) {
      this.centerX = x;
      this.centerY = y;
    } else {
      this.left = x;
      this.top = y;
    }
    if (this.id == null || this.id.length == 0)
      this.id = this.hashCode.toString();
  }
  
  void update() {
    if (previousBox == null)
      previousBox = new DRectangle.clone(this);
    else
      previousBox.updateFrom(this);
    
    // if not enabled, do not apply momentum.
    if (!enabled)
      return;
    
    momentum.update(game.clockTick);
    left += momentum.xVel * game.clockTick;
    top += momentum.yVel * game.clockTick;
  }
  
  void removeFromGame() {
    _removeFromGame = true;
  }
  
  bool outsideScreen() {
    return !game.rect.containsRectangle(this);
  }
  
  bool collidesWith(GameEntity entity) {
    // TODO: Check for radius to see if collision should be circular
        
    if (!entity.enabled)
      return false;
        
    return entity.intersects(this);
  }
}
