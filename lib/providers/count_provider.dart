import 'package:flutter/material.dart';

class CountProvier extends ChangeNotifier {
  int count = 0;
  void addIncrement() {
    count++;
    notifyListeners();
  }
}
