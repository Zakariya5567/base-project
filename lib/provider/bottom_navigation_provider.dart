import 'package:flutter_base_project/helper/routes_helper.dart';
import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;
// set Current Index
  setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  // Rest Index
  resetIndex() {
    currentIndex = 3;
    notifyListeners();
  }

  String currentScreen() {
    String screen = RouterHelper.homeScreen;
    switch (currentIndex) {
      case 0:
        screen = RouterHelper.homeScreen;
        break;
      case 1:
        // screen = RouterHelper.moreScreen;
        break;
    }
    return screen;
  }

/*=====================================
  APIs calling
 ======================================*/
  // Veriables
}
