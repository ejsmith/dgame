part of dgame_html;

class HtmlGameInput extends GameInput {
  void start() {
    print('Starting input');
    
    Vector getXandY(e) {
      num x =  e.clientX - game.rect.x - game.rect.halfWidth;
      num y = e.clientY - game.rect.y - game.rect.halfHeight;
      return new Vector(x, y);
    }
    
    document.on.click.add((e) {
      click = getXandY(e);
    });
    
    document.on.mouseMove.add((e) {
      mouse = getXandY(e);
    });
    
    document.on.touchMove.add((TouchEvent e) {
      e.preventDefault();
      mouse = getXandY(e.touches[0]);
      return false;
    });
    
    document.on.touchStart.add((e) {
      e.preventDefault();
      return false;
    });
    
    document.on.keyDown.add((KeyboardEvent e) {
      keyCode = e.keyCode;
    }, false);

    document.on.mouseDown.add((e) {
      mouseDown = true;
    });
    
    document.on.mouseUp.add((e) {
      mouseDown = false;     
    });
    
    print('Input started');
  }
}
