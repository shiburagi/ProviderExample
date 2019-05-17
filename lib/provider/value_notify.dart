import 'package:flutter/widgets.dart';

class ValueNotify with ChangeNotifier {
  int value = 0;
  void setValue(int value) {
    this.value = value;
    notifyListeners();
  }

  int getValue() => this.value;
}
