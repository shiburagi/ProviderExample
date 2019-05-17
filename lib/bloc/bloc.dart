
import 'dart:async';

class Bloc {
  final StreamController<int> _streamController = StreamController();
  Stream<int> stream;

  Bloc() {
    stream = _streamController.stream.asBroadcastStream();
    update(0);
  }

  update(int value){
    _streamController.sink.add(value);
  }

  void dispose() {
    _streamController.close();
  }
}