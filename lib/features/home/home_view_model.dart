import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  var loader = false;

  void initViewModel() {}

  void disposeViewModel() {
    loader = false;
  }

  void updateUi() => notifyListeners();
}
