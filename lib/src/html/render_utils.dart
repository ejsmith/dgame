part of dgame_html;

class RenderUtils {
  static void drawDashedLine(ctx, x, y, x2, y2, [da]) { 
    if (da == null)
      da = [10,5];
    
    var dashCount = da.length;
    ctx.moveTo(x, y);
    var dx = (x2 - x), dy = (y2 - y);
    var slope = dy;
    if (dx != 0)
      slope = dy / dx;
    var distRemaining = Math.sqrt(dx * dx + dy * dy);
    var dashIndex = 0, drawLine = true;
    while (distRemaining>=0.1 && dashIndex < 10000){
      var dashLength = da[dashIndex++ % dashCount];
      if (dashLength > distRemaining) dashLength = distRemaining;
      var xStep;
      xStep = Math.sqrt(dashLength * dashLength / (1 + slope * slope));
      x += xStep;
      y += slope * xStep;
      if (drawLine)
        ctx.lineTo(x, y);
      else
        ctx.moveTo(x, y);
      distRemaining -= dashLength;
      drawLine = !drawLine;
    }
    
    ctx.moveTo(0, 0);
  }
}
