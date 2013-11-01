part of dgame_html;

class CanvasGameRenderer<G extends Game> extends GameRenderer<G> {
  String targetId;
  CanvasRenderingContext2D ctx;
  GameEntityRenderer defaultRenderer;
  AssetManager assetManager;
  TextRenderer textRenderer;
  bool ownMouse;
  CanvasElement canvas;
  
  CanvasGameRenderer(String this.targetId) {
    canvas = querySelector('#$targetId');
    document.onPointerLockChange.listen(pointerLockChange);
    canvas.onClick.listen(clicked);
    ctx = canvas.context2D;
    rect = new MutableRectangle(0, 0, ctx.canvas.width, ctx.canvas.height);
    var clientRect = ctx.canvas.getBoundingClientRect();
    ownMouse = false;
    
    rect.top = clientRect.top;
    rect.left = clientRect.left;
    rect.width = clientRect.width;
    rect.height = clientRect.height;
    
    defaultRenderer = new DefaultCanvasEntityRenderer(this);
    textRenderer = new TextRenderer(this);
  }
  
  GameEntityRenderer getRenderer(GameEntity e) {
    if (e is GameText)
      return textRenderer;
    
    return defaultRenderer;
  }
  
  void render() {
    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    ctx.fillStyle = game.bgStyle;
    ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    ctx.save();
    ctx.translate(ctx.canvas.width / 2, ctx.canvas.height / 2);
    
    for (final GameEntity e in game.entities) {
      // don't render objects that are not enabled.
      if (!e.enabled)
        continue;
      
      var r = getRenderer(e);
      if (r != null)
        r.render(e);
    }
    
    drawBeforeCtxRestore();
    ctx.restore();
  }
  
  void drawBeforeCtxRestore() {
    if (Game.debugMode)
      drawDebugInfo();
  }
  
  void drawDebugInfo() {
    ctx.fillStyle = "rgba(255, 255, 255, 0.2)";
    ctx.font = "16px Verdana";
    ctx.fillText("FPS: ${game.timer.fps.toStringAsFixed(1)}", ((rect.width / 2) - 120), -((rect.height / 2) - 30));
  }
  
  void clicked(Event event) {
    //canvas.requestFullscreen();
    //canvas.requestPointerLock();
  }
  
  bool get _pointerLocked => canvas == document.pointerLockElement;
  
  void pointerLockChange(Event event) {
    ownMouse = _pointerLocked;
  }
}
