part of dgame_html;

class DefaultCanvasEntityRenderer<E extends GameEntity> implements GameEntityRenderer<E> {
  CanvasGameRenderer gr;
  
  DefaultCanvasEntityRenderer(CanvasGameRenderer this.gr);
  
  void render(E e) {
    if (e.color != null) {
      if (e.fill) {
        gr.ctx.fillStyle = "rgba(${e.color}, ${e.opacity})";
        gr.ctx.fillRect(e.box.left, e.box.top, e.box.width, e.box.height);
      } else {
        gr.ctx.strokeStyle = "rgba(${e.color}, ${e.opacity})";
        gr.ctx.strokeRect(e.box.left, e.box.top, e.box.width, e.box.height);
      }
    }
    
    if (gr.game.showOutlines) {
      gr.ctx.beginPath();
      gr.ctx.strokeStyle = "green";
      gr.ctx.arc(e.x, e.y, e.radius, 0, Math.PI * 2, false);
      gr.ctx.stroke();
      gr.ctx.closePath();
    }
  }
  
  void drawSpriteCentered(E e) {
    num cx = e.x - e.sprite.width / 2;
    num cy = e.y - e.sprite.height / 2;
    gr.ctx.drawImage(e.sprite, cx, cy);
  }
  
  CanvasElement rotateAndCache(image, angle) {
    CanvasElement offscreenCanvas = new Element.tag("canvas");
    var size = Math.max(image.width, image.height);
    offscreenCanvas.width = size;
    offscreenCanvas.height = size;
    CanvasRenderingContext2D offscreenCtx = offscreenCanvas.getContext('2d');
    offscreenCtx.save();
    offscreenCtx.translate(size / 2, size / 2);
    offscreenCtx.rotate(angle + Math.PI / 2);
    offscreenCtx.translate(0,0);
    offscreenCtx.drawImage(image, -(image.width / 2), -(image.height / 2));
    offscreenCtx.restore();
    
    return offscreenCanvas;
  }
}
