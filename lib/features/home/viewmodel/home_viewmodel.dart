import 'package:flutter/foundation.dart';

class HomeViewmodel extends ChangeNotifier {
  int currentIndex = 0;

  changeIndexBottomtab(int index) {
    print("INDEX-$index");
    currentIndex = index;
    notifyListeners();
  }
}
