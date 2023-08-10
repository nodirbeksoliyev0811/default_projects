import 'package:default_project/ui/screens/screen_one.dart';
import 'package:default_project/ui/screens/screen_three.dart';
import 'package:default_project/ui/screens/screen_two.dart';
import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  List<Widget> screens = [
    const ScreenOne(),
    const ScreenTwo(),
  ];

  int activeIndex = 0;

  void checkIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
