part of dgame_html;

class AssetManager {
  num _successCount = 0;
  num _errorCount = 0;
  Map _cache;
  List _downloadQueue;
  
  AssetManager() {
    _downloadQueue = [];
    _cache = {};
  }
  
  void queueDownload(String path) {
    _downloadQueue.add(path);
  }
  
  void downloadAll(downloadCallback) {
    if (_downloadQueue.length == 0) {
      downloadCallback();
    }
    
    for (final String path in _downloadQueue) {
      var el = new ImageElement();
      el.onLoad.listen((event) {
        print('${el.src} is loaded');
        _successCount += 1;
        if (isDone()) {
            downloadCallback();
        }
      });
      el.onError.listen((event) {
        _errorCount += 1;
        if (isDone()) {
            downloadCallback();
        }
      });
      el.src = path;
      _cache[path] = el;
    }
  }
  
  getAsset(String path) {
    return _cache[path];
  }
  
  bool isDone() {
    return (_downloadQueue.length == _successCount + _errorCount);
  }
}
