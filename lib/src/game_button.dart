part of dgame;

typedef void ButtonCallback();

class GameButton extends GameText {
  ButtonCallback buttonAction;

  GameButton({Game game, num x, num y, String text, ButtonCallback this.buttonAction, num height: 25, String font, bool centered: true, String color: "255, 255, 255", num opacity: 0.4, String id, String groupId})
    : super(game: game, x: x, y: y, text: text, height: height, font: font, centered: centered, color: color, opacity: opacity, id: id, groupId: groupId) {
    opacity = 0.5;
    color = color;
  }

  void update() {
    super.update();

    if(!enabled)
      return;
    
    if (game.input.click != null) {
      //print("x: ${game.input.click.x} y: ${game.input.click.y}");
      //print(box.contains(game.input.click));
    }

    if (game.input.mouse != null && containsPoint(game.input.mouse)) {
      isHighlighted = true;
      opacity = 1.0;
    }
    else {
      isHighlighted = false;
      opacity = 0.7;
    }

    if (game.input.click != null && containsPoint(game.input.click)) {
      opacity = 1.0;
      new Timer(const Duration(milliseconds: 250), () => opacity = 0.5);
      buttonAction();
    }
  }
}
