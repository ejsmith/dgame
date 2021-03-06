part of dgame_html;

class HtmlGameSound extends GameSound {
  HtmlGameSound(String sound, [double volume = 1.0, bool looping = false]) : super(sound, volume, looping) {}

  AudioElement audioCopy;

  void play(String sound, [double volume = 1.0, bool looping = false]) {
    if (!enabled)
      return;

    if (Game.debugMode)
      print("Playing: $sound");

    AudioElement sourceAudio = querySelector("#sound_$sound");
    if (sourceAudio == null)
      sourceAudio = querySelector("#$sound");

    if (sourceAudio == null) {
      sourceAudio = new AudioElement();
      sourceAudio.id = "sound_$sound";
      sourceAudio.preload = "auto";

      var s = new SourceElement();
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
    audioCopy.currentTime = 999;
    audioCopy.pause();
    audioCopy.volume = 0;
    audioCopy.remove();
    audioCopy.loop = false;
  }
}
