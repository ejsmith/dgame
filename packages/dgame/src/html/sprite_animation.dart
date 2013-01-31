part of dgame_html;

class SpriteAnimation {
  ImageElement spriteSheet;
  num frameWidth;
  num frameHeight;
  num frameDuration;
  num totalTime;
  bool loop;
  int elapsedTime = 0;
  
  SpriteAnimation(ImageElement this.spriteSheet, num this.frameWidth, num this.frameDuration, [bool this.loop = false]) {
    frameHeight = spriteSheet.height;
    totalTime = (spriteSheet.width / frameWidth) * frameDuration;
  }
  
  void drawFrame(num tick, CanvasRenderingContext2D ctx, num x, num y, [num scaleBy = 1]) {
    elapsedTime += tick;
    if (loop) {
        if (isDone()) {
            elapsedTime = 0;
        }
    } else if (isDone()) {
        return;
    }
    num index = currentFrame();
    num locX = x - (frameWidth / 2) * scaleBy;
    num locY = y - (frameHeight / 2) * scaleBy;
    
    ctx.drawImage(spriteSheet,
                  index * frameWidth, 0,
                  frameWidth, frameHeight,
                  locX, locY,
                  frameWidth * scaleBy,
                  frameHeight * scaleBy);
  }
  
  bool isDone() {
    return (elapsedTime >= totalTime);
  }
  
  num currentFrame() {
    return (elapsedTime / frameDuration).floor();
  }
}