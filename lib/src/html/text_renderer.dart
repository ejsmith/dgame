part of dgame_html;

class TextRenderer extends DefaultCanvasEntityRenderer<GameText> {
  TextRenderer(GameRenderer gr) : super(gr);
  
  void render(GameText b) {
    gr.ctx.fillStyle = "rgba(${b.color}, ${b.opacity})";
    gr.ctx.font = "${b.height}px ${b.font}";
    
    b.width = gr.ctx.measureText(b.text).width;
    gr.ctx.fillText(b.text, b.left, b.bottom);
  }
}