part of dgame;

class GameText extends GameEntity {
  String text;
  bool centered = true;
  String font;
  num size;
  
  GameText({Game game, num x, num y, String this.text, num this.size, String this.font, bool this.centered, String color, num opacity, String id, String groupId})
    : super.withPosition(game, x, y, 10, 10, id, groupId) {
    color = color;
    this.opacity = opacity;
  }
  
  void updateBox() {
    if (box == null)
      box = new Rectangle(0, 0, 0, 0);
    
    _height = size;
    
    if (centered) {
      super.updateBox();
    } else {
      box.left = x;
      box.top = y;
      box.right = box.left + width;
      box.bottom = box.top + height;
    }
  }
}
