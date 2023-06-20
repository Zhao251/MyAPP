import 'package:flutter/material.dart';

class NumberPickerProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void setCount(int value) {
    _count = value;
    notifyListeners();
  }
}
