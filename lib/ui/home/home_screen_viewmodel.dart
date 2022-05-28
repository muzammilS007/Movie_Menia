import 'package:flutter/material.dart';

class HomeScreenViewModel with ChangeNotifier{
  int index = 0;
  void onTap(int index) {
    this.index = index;
    notifyListeners();

  }
}