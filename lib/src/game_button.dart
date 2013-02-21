part of dgame;

typedef void ButtonCallback();

class GameButton extends GameText {
  ButtonCallback buttonAction;
  
  GameButton({Game game, num x, num y, String text, ButtonCallback this.buttonAction, num size: 25, String font, bool centered: true, String color: "255, 255, 255", num opacity: 0.4, String id, String groupId})
    : super(game: game, x: x, y: y, text: text, size: size, font: font, centered: centered, color: color, opacity: opacity, id: id, groupId: groupId) {
    opacity = 0.5;
    color = color;
  }
  
  void update() {
    super.update();
    
    if(!enabled)
      return;
    
    if (game.input.click != null) {
      print("x: ${game.input.click.x} y: ${game.input.click.y}");
      print(box.contains(game.input.click));
    }
    
    if (game.input.mouse != null && box.contains(game.input.mouse)) {
      isHighlighted = true;
      opacity = 1.0;
    }
    else {
      isHighlighted = false;
      opacity = 0.5;
    }
    
    if (game.input.click != null && box.contains(game.input.click)) {
      opacity = 1.0;
      new Timer(const Duration(milliseconds: 250), (t) => opacity = 0.5);
      buttonAction();
    }
  }
}
