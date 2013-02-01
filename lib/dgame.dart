library dgame;
import "dart:math" as Math;
import "dart:async";

part "src/game_timer.dart";
part "src/game_entity.dart";
part "src/vector.dart";
part "src/rectangle.dart";
part "src/math.dart";
part "src/momentum.dart";
part "src/game_sound.dart";
part "src/game_input.dart";
part "src/game_renderer.dart";
part "src/game_entity_renderer.dart";
part "src/game_loop.dart";
part "src/game_text.dart";
part "src/game_button.dart";

class Game {
  List<GameEntity> entities;
  GameTimer timer;
  num clockTick;
  Rectangle rect;
  static bool debugMode = false;
  GameSound sound;
  GameInput input;
  GameRenderer renderer;
  GameLoop loop;
  
  // UI attributes
  String bgStyle = "rgba(0, 0, 0, .85)";
  bool showOutlines = false;
  
  Game(Rectangle this.rect) {
    timer = new GameTimer();
    sound = new GameSound();
    input = new GameInput();
    renderer = new GameRenderer();
    loop = new GameLoop();
    entities = [];
  }
  
  Game.withServices(GameSound this.sound, GameInput this.input, GameRenderer this.renderer, GameLoop this.loop) {
    timer = new GameTimer();
    entities = new List<GameEntity>();
    rect = renderer.rect;

    input.game = this;
    renderer.game = this;
  }
  
  void start() {
    print("starting game");
    input.start();
    loop.start(() {
      clockTick = this.timer.tick();
      update();
      renderer.render();
      input.reset();
    });
  }
  
  void addEntity(GameEntity entity) {
    entities.add(entity);
  }
  
  void removeEntity(String id) {
    entities.where((e) => e.id == id).toList().forEach((e) => e.removeFromGame());
  }
  
  void enableEntitiesByGroup(String groupId) {
    entities.where((e) => e.groupId == groupId).forEach((e) => e.enabled = true);
  }
  
  void disableEntitiesByGroup(String groupId) {
    entities.where((e) => e.groupId == groupId).forEach((e) => e.enabled = false);
  }
  
  void removeEntitiesByGroup(String groupId) {
    entities.where((e) => e.groupId == groupId).toList().forEach((e) => e.removeFromGame());
  }
  
  void removeEntitiesByFilter(bool f(GameEntity entity)) {
    entities.where((e) => f(e)).toList().forEach((e) => e.removeFromGame());
  }
  
  GameEntity getEntity(String id) {
    return entities.firstMatching((e) => e.id == id, orElse: () => null);
  }
  
  void update() {
    num entitiesCount = entities.length;
    
    for (GameEntity entity in entities.where((e) => !e._removeFromGame).toList())
      entity.update();
    
    for (int i = entities.length - 1; i >= 0; --i) {
      if (entities[i]._removeFromGame) {
        entities.removeRange(i, 1);
      }
    }
  }
}
