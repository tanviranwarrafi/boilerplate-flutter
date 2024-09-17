import 'dart:async';

import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/services/routes.dart';
import 'package:flutter/material.dart';

class GlobalViewModel with ChangeNotifier {
  Future<void> initViewModel() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void updateUi() => notifyListeners();

  void onLogout() {
    sl<AuthService>().clearUserData();
    sl<AuthService>().signOutUpdate();
    sl<Routes>().sign_in().pushAndRemove();
  }
}
