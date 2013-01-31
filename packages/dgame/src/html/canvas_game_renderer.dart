part of dgame_html;

class CanvasGameRenderer<G extends Game> extends GameRenderer<G> {
  String targetId;
  CanvasRenderingContext2D ctx;
  GameEntityRenderer defaultRenderer;
  AssetManager assetManager;
  TextRenderer textRenderer;
  
  CanvasGameRenderer(String this.targetId) {
    CanvasElement canvas = query('#$targetId');
    ctx = canvas.getContext('2d');
    rect = new Rectangle(0, 0, ctx.canvas.width, ctx.canvas.height);
    var clientRect = ctx.canvas.getBoundingClientRect();
    
    rect.top = clientRect.top;
    rect.left = clientRect.left;
    rect.right = clientRect.right;
    rect.bottom = clientRect.bottom;
    
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
    ctx.fillText("FPS: ${game.timer.fps.toStringAsFixed(1)}", (rect.halfWidth - 120), -(rect.halfHeight - 30));
  }
}
