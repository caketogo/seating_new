import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var _count = 0;

  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 2;
    notifyListeners();
  }
}
