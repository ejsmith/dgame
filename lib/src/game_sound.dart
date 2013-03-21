part of dgame;

class GameSound {
  bool enabled = true;
  String Id;
  String _rootDirectory = "Sounds/";
  String get rootDirectory => _rootDirectory;
  set rootDirectory(String value) {
    if (!value.endsWith("/"))
      value = value.concat("/");
    _rootDirectory = value;
  }
  
  void play(String sound, String id, [double volume = 1.0, bool looping = false]) {}
}
