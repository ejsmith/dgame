part of dgame_html;

class HtmlGameInput extends GameInput {
  void start() {
    Point getXandY(e) {
      num x =  e.clientX - game.rect.left - game.rect.halfWidth;
      num y = e.clientY - game.rect.height - game.rect.halfHeight;
      return new Point(x, y);
    }
    
    document.onClick.listen((MouseEvent e) {
      click = getXandY(e);
    });
    
    document.onMouseMove.listen((MouseEvent e) {
      mouse = getXandY(e);
    });
    
    document.onTouchMove.listen((TouchEvent e) {
      e.preventDefault();
      mouse = getXandY(e.touches[0]);
      return false;
    });
    
    document.onTouchStart.listen((TouchEvent e) {
      e.preventDefault();
      return false;
    });
    
    document.onKeyDown.listen((KeyboardEvent e) {
      keyDownEventStream.signal(new GameKeyboardEvent(e.keyCode, e.altKey, e.ctrlKey, e.shiftKey));
    });
    
    document.onKeyUp.listen((KeyboardEvent e) {
      keyUpEventStream.signal(new GameKeyboardEvent(e.keyCode, e.altKey, e.ctrlKey, e.shiftKey));
    });
    
    document.onMouseDown.listen((MouseEvent e) {
      mouseDown = true;
    });
    
    document.onMouseUp.listen((MouseEvent e) {
      mouseDown = false;     
    });
  }
}
