part of dgame_html;

class HtmlGameSound extends GameSound {
  HtmlGameSound() : super(super.Sound, super.Id, super.Volume, super.Looping) {}
  
  AudioElement audioCopy;
  
  void play(String sound, String id, [double volume = 1.0, bool looping = false]) {
    if (!enabled)
      return;
    
    if (Game.debugMode)
      print("Playing: $sound");
    
    AudioElement sourceAudio = query("#sound_$sound");
    if (sourceAudio == null)
      sourceAudio = query("#$sound");
    
    if (sourceAudio == null) {
      sourceAudio = new AudioElement();
      sourceAudio.id = "sound_$sound";
      sourceAudio.preload = "auto";
      
      var s = new SourceElement();
      s.src = "$rootDirectory$sound.mp3";
      s.type = "audio/mp3";
      sourceAudio.nodes.add(s);
      
      s = new SourceElement();
      s.src = "$rootDirectory$sound.ogg";
      s.type = "audio/ogg";
      sourceAudio.nodes.add(s);
      
      document.body.nodes.add(sourceAudio);
    }
    
    audioCopy = sourceAudio.clone(true) as AudioElement;
    audioCopy.id = "";
    document.body.nodes.add(audioCopy);
    
    audioCopy.onEnded.listen((e) {
      if (Game.debugMode)
        print("removed");
      audioCopy.remove();
    });
    
    if (!enabled) 
      audioCopy.remove();
    
    if (volume != null)
      audioCopy.volume = round(volume, 3);
    
    if (looping)
      audioCopy.loop = true;
      
    audioCopy.play();
    audioCopy.classes.add("sound-clone");
  }
  
  void remove() {
    audioCopy.remove();
  }
}
