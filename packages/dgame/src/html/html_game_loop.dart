part of dgame_html;

class HtmlGameLoop extends GameLoop {
  LoopCallback _callback;
  start(LoopCallback callback) {
    _callback = callback;
    window.requestAnimationFrame(loop);
  }
  
  loop(var time) {
    _callback();
    window.requestAnimationFrame(loop);
  }
}
