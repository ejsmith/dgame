part of dgame;

class GameText extends GameEntity {
  String text;
  String font;
  
  GameText({Game game, num x, num y, String this.text, num height, String this.font, bool centered, String color, num opacity, String id, String groupId})
    : super.withPosition(game, x, y, 10, height, id, groupId, centered) {
    color = color;
    this.opacity = opacity;
  }
}
