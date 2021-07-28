import 'dart:async';

class SlideBloc {
  static SlideBloc? _instance;
  final _slideStreamConroller = StreamController<int>();

  static SlideBloc getInstance() {
    if(_instance == null) {
      _instance = new SlideBloc();
    }
    return _instance!;
  }

  static void destroy() {
    _instance = null;
  }

  StreamSink<int> get slideSink => _slideStreamConroller.sink;

  Stream<int> get slideStream => _slideStreamConroller.stream;

  void dispose() {
    _slideStreamConroller.close();
  }
}