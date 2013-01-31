part of dgame;

class GameEntityRenderer<E extends GameEntity> {
  GameRenderer gr;
  GameEntityRenderer(GameRenderer this.gr);
  void render(E e) {}
}
