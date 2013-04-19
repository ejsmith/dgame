part of dgame;

class GameSound {
  bool enabled = true;
  String Id;
  String Sound;
  double Volume;
  bool Looping;
  String _rootDirectory = "Sounds/";
  String get rootDirectory => _rootDirectory;
  set rootDirectory(String value) {
    if (!value.endsWith("/"))
      value = value + "/";
    _rootDirectory = value;
  }
  
  GameSound(String sound, [double volume = 1.0, bool looping = false]) {
    Sound = sound;
    Volume = volume;
    Looping = looping;
  }
  
  void play(String sound, [double volume = 1.0, bool looping = false]) {}
  
  void remove() {}
}
