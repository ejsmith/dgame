part of dgame_html;

class HtmlGameInput extends GameInput {
  void start() {
    print('Starting input');
    
    Vector getXandY(e) {
      num x =  e.clientX - game.rect.x - game.rect.halfWidth;
      num y = e.clientY - game.rect.y - game.rect.halfHeight;
      return new Vector(x, y);
    }
    
    document.onClick.listen((e) {
      click = getXandY(e);
    });
    
    document.onMouseMove.listen((e) {
      mouse = getXandY(e);
    });
    
    document.onTouchMove.listen((TouchEvent e) {
      e.preventDefault();
      mouse = getXandY(e.touches[0]);
      return false;
    });
    
    document.onTouchStart.listen((e) {
      e.preventDefault();
      return false;
    });
    
    document.onKeyDown.listen((KeyboardEvent e) {
      keyCode = e.keyCode;
    });
    
    document.onMouseDown.listen((e) {
      mouseDown = true;
    });
    
    document.onMouseUp.listen((e) {
      mouseDown = false;     
    });
    
    print('Input started');
  }
}
